require 'rails_helper'
require 'apicall'

RSpec.feature "User creates a new gif" do
  scenario "they see the page for the individual gif" do
    APICall.stub(:image_path) { "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif" }

    visit gifs_path

    click_on "New Gif"

    fill_in "Search term", with: "funny"
    click_on "Create Gif"

    expect(page).to have_content "funny"
    expect(page).to have_css("img[src='http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif']")
  end
end
