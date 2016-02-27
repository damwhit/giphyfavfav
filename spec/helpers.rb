require 'json'

module Helpers
  def login_user
    User.create(username: "July",
                password: "password")

    visit login_path
    fill_in "Username", with: "July"
    fill_in "Password", with: "password"
    click_button "Login"
  end

end
