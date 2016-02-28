require 'rails_helper'
require 'apicall'

RSpec.feature "Admin creates a new gif" do
  scenario "they see the page for the individual gif" do
    APICall.stub(:image_path) { "http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif" }
    create_and_stub_admin

    visit admin_gifs_path

    click_on "New Gif"

    fill_in "Search term", with: "funny"
    click_on "Create Gif"

    expect(page).to have_content "funny"
    expect(page).to have_css("img[src='http://media2.giphy.com/media/jixtchplI4vYY/giphy.gif']")
  end
end
