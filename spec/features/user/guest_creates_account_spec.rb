require 'rails_helper'

RSpec.feature "guest creates account" do
  scenario "user sees welcome message" do
    visit new_user_path

    # save_and_open_page

    fill_in "Username", with: "July"
    fill_in "Password", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Welcome, July!")
  end
end
