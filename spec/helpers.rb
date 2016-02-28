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

  def create_and_stub_admin
    admin = User.create(username: "david",
                          password: 'password',
                          role: 1
                          )
    ApplicationController.any_instance.stub(:current_user) {admin}
  end

end
