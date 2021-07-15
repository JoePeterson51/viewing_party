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
        expect(page).to have_content("Rating: 8.3")
        expect(page).to have_content("Length: 2 Hours 18 Minutes")
        expect(page).to have_content("Genere(s): Action, Science Fiction")
        expect(page).to have_content("The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.")
        expect(page).to have_content("Character: Dan Forester")
        expect(page).to have_content("Actor: Chris Pratt")
        expect(page).to have_content("Username: Kamurai")
        expect(page).to have_content("Rating: 8.0")
        expect(page).to have_content("Reviews")
      end
    end
  end
end