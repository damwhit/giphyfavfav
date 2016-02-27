require 'rails_helper'

RSpec.feature "user logs in and out" do

  context "user can log in" do
    scenario "logged in user sees dashboard" do
      pending
      login_user

      expect(page).to have_content("Welcome, July!")
      expect(page).to have_content("Logout")
    end
  end

  context "guest cannot login" do
    scenario "guest sees invalid message" do
      pending
      visit login_path
      fill_in "Username", with: "July"
      fill_in "Password", with: "password"
      click_button "Login"

      expect(page).to have_content("Invalid. Try Again.")
      expect(page).to have_content("Login")
    end
  end

  context "registered user cannot login with wrong password" do
    scenario "user sees invalid message" do
      pending
      user = User.create(username: "July",
                         password: "password")

      visit login_path
      fill_in "Username", with: "July"
      fill_in "Password", with: "notmypassword"
      click_button "Login"

      expect(page).to have_content("Invalid. Try Again.")
      expect(page).to have_content("Login")
    end
  end

  context "authenticated user can logout" do
    scenario "user sees log out page" do
      pending
      login_user

      expect(page).to have_content("Welcome, July!")

      click_link "Logout"

      expect(page).to have_content("Goodbye!")
      expect(page).to have_content("Login")
    end
  end
end
