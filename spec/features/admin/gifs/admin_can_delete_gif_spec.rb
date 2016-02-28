require 'rails_helper'
require 'apicall'

RSpec.feature "Admin can delete a gif" do
  scenario "they do not see the deleted gif" do
    APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }

    create_and_stub_admin

    category = Category.where(name: "funny").first_or_create
    gif = category.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

    visit admin_gif_path(gif)

    click_on "Delete"

    expect(current_path).to eq(admin_gifs_path)
    expect(page).to_not have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")
  end
end
