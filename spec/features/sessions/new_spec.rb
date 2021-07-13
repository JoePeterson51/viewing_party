require 'rails_helper'

RSpec.describe "login page" do
    describe 'logging in' do
        it 'as a registered user, I can log in with correct credentials' do
            user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')

            visit root_path

            click_on "Log in here"

            expect(current_path).to eq("/login")
            expect(page).to have_content("Log In")

            fill_in :username, with: "person@ex.com"
            fill_in :password, with: "ilovecatsanddogs"

            click_on "Log in"

            expect(current_path).to eq(user_dashboard_index_path)
            expect(page).to have_content("Welcome, person@ex.com!")
            expect(page).to have_link("Log out")

            click_link("Log out")

            expect(current_path).to eq(root_path)
            expect(page).to_not have_link("Log out")
            expect(page).to have_link("Register here")
        end

        it 'as a registered user, I cant log in with incorrect credentials' do
            user = User.create(username: 'person@ex.com', password: 'ilovedogs')

            visit root_path

            click_on "Log in here"

            expect(current_path).to eq(login_path)

            fill_in :username, with: "person@ex.com"
            fill_in :password, with: "ilovecats"

            click_on "Log in"

            expect(current_path).to eq(login_path)
            expect(page).to have_content("Your username or password are incorrect")

        end
    end
end