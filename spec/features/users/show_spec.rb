require 'rails_helper'

RSpec.describe 'dashboard' do

  before :each do
      @user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
      @user_1 = User.create(username: 'person@ex1.com', password: 'ilovecatsanddogs2')
      @user_2 = User.create(username: 'person@ex2.com', password: 'ilovecatsanddogs3')

      visit root_path

      click_on "Log in here"

      expect(current_path).to eq("/login")
  end
  describe 'dashboard' do
    it 'has a welcome with username' do

      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"

      expect(current_path).to eq(user_dashboard_index_path)
      expect(page).to have_content("Welcome, person@ex.com!")
      expect(page).to have_button("Discover Movies")
    end

    it 'has a friend list with no friends' do
      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"
      expect(page).to have_content("Friend List")
      expect(page).to have_content("You currently have no friends.")
    end

    it 'has a friend list with friends' do
      Friendship.create(user: @user, friend: @user_1)

      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"
      expect(page).to have_content("Friend List")
      within("#friends-list") do
        expect(page).to have_content(@user_1.username)
      end
    end

    it 'can add friends' do
      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"

      fill_in :search_by_username, with: 'person@ex2.com'
      click_on "Search"
      click_on "Add #{@user_2.username}"

      within("#friends-list") do
        expect(page).to have_content(@user_2.username)
      end
    end

    it 'has a discover movies button' do
      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"
      expect(page).to have_button("Discover Movies")
    end

    it 'has a viewing parties section' do
      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"
      expect(page).to have_content("Viewing Parties")
    end
  end
end