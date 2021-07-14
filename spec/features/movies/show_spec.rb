require 'rails_helper'

RSpec.describe 'movies show' do
  before :each do
    user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
    visit root_path
    click_on "Log in here"
    fill_in :username, with: "person@ex.com"
    fill_in :password, with: "ilovecatsanddogs"
    click_on "Log in"
    click_on "Discover Movies"
    VCR.use_cassette "search_results" do
      fill_in :search, with: "The Tomorrow War"
      click_on "Search"
    end
  end

  describe 'movies show' do
    it 'shows the movies details' do
      VCR.use_cassette "movie_show" do
        click_on "The Tomorrow War"
        expect(page).to have_content("The Tomorrow War")
      end
    end
  end
end