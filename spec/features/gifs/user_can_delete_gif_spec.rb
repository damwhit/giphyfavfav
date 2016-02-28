require 'rails_helper'
require 'apicall'

RSpec.feature "User can delete a gif" do
  scenario "they do not see the deleted gif" do
    APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }

    category = Category.where(name: "funny").first_or_create
    gif = category.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

    visit gif_path(gif)

    click_on "Delete"

    expect(current_path).to eq(gifs_path)
    expect(page).to_not have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")
  end
end
