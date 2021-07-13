require 'rails_helper'

RSpec.describe 'movies' do
  before :each do
    user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
    visit root_path
    click_on "Log in here"
    fill_in :username, with: "person@ex.com"
    fill_in :password, with: "ilovecatsanddogs"
    click_on "Log in"
    click_on "Discover Movies"
  end

  describe 'top 40 movies' do
    describe 'top movies info' do
      it 'has movies' do
        VCR.use_cassette "Top_40_movies" do
          click_on "Discover Top 40 Movies"
          expect(current_path).to eq("/movies")
          expect(page).to have_content("Top 40 Movies")
          expect(page).to have_content("The Tomorrow War")
          movies = find_all('.movie')
          expect(movies.size).to eq(40)
        end
      end
    end
  end
end
