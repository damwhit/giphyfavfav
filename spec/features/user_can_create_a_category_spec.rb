require 'rails_helper'

RSpec.feature "User creates a new category" do
  scenario "they see the page for the individual category" do

    visit categories_path

    click_on "New Category"
    # save_and_open_page

    fill_in "Name", with: "funny"

    click_on "Create Category"

    # user types in one word search term
    # search term is sent to giphy api and an image path for a category is returned
    # image path is subitted into our text field for form

    expect(page).to have_content "funny"
  end
end
