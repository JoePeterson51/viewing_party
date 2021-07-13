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

  describe 'search' do
    describe 'search movies' do
      it 'can search for movies' do
        VCR.use_cassette "search_results" do
          fill_in :search, with: "The Tomorrow War"
          click_on "Search"
          expect(current_path).to eq("/movies")
          expect(page).to have_content("Search Results")
          expect(page).to have_content("The Tomorrow War")
          movies = find_all('.movie')
          expect(movies.size).to be < 41
        end
      end
    end
  end
end