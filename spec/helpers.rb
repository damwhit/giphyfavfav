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

  def image_path_one
    response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=funny+cat&limit=1&api_key=dc6zaTOxFJmzC")
    data = JSON.parse(response.body, object_class: OpenStruct)
    rull_data = data.data
    image_path = rull_data.first.url
    return image_path
  end
end
