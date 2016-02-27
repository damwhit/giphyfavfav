require 'rails_helper'

RSpec.feature "User creates a new gif" do
  scenario "they see the page for the individual gif" do
    pending

    visit gifs_path

    click_on "New Gif"

    fill_in :category, with: "funny"
    click_on "Create Gif"

    # user types in one word search term
    # search term is sent to giphy api and an image path for a gif is returned
    # image path is subitted into our text field for form

    expect(page).to have_content "funny"
    expect(page).to have_css("img[src=\"#{image_path_one}\"]")
  end
end
