require 'rails_helper'

RSpec.describe 'shows all movies' do
  before :each do
    user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
    visit root_path
    click_on "Log in here"
    fill_in :username, with: "person@ex.com"
    fill_in :password, with: "ilovecatsanddogs"
    click_on "Log in"
    click_on "Discover Movies"
  end

  it 'goes to discover path' do
    expect(page.status_code).to eq 200
    expect(current_path).to eq(discover_path)
  end

  it 'has a top 40 button' do
    VCR.use_cassette "Top_40_movies" do
      click_on "Discover Top 40 Movies"
      expect(current_path).to eq(movies_path)
    end
  end

  it 'has a search bar' do
    expect(page).to have_content('Search For Movies by Title:')
  end
end