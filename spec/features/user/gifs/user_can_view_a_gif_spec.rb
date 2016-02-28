require 'rails_helper'
require 'apicall'

RSpec.feature "user can view all gifs" do
  scenario "they can see all gifs sorted by category" do
    APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }
    login_user

    cat = Category.create(name: "lolololololol")
    gif = cat.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

    visit gif_path(gif)
    save_and_open_page

    expect(page).to have_content "lolololololol"
    expect(page).to have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")


  end
end
