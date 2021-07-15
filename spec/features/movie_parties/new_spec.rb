require 'rails_helper'

RSpec.describe "new viewing party" do
  before :each do
    @user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
    @user_1 = User.create(username: 'person@ex3.com', password: 'ilovecatsanddogs3')
    @user_2 = User.create(username: 'person@ex4.com', password: 'ilovecatsanddogs4')
    Friendship.create(user: @user, friend: @user_1)
    Friendship.create(user: @user, friend: @user_2)
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
    VCR.use_cassette "movie_show" do
      click_on "The Tomorrow War"
    end
  end

  describe 'new page' do
    it 'has new viewing party details' do
      VCR.use_cassette "create_viewing_party" do
        click_on "Create Viewing Party!"
        save_and_open_page
        expect(current_path).to eq('/movie_party/new')
        expect(page).to have_content("Please Enter Viewing Party Information Here")
        expect(page).to have_content("The Tomorrow War")
        expect(page).to have_content("Duration In Minutes")
      end
    end
  end
end