require 'rails_helper'

RSpec.feature "Admin creates a new category" do
  scenario "they see the page for the individual category" do
    create_and_stub_admin

    visit admin_categories_path


    click_on "New Category"

    fill_in "Name", with: "funny"

    click_on "Create Category"

    expect(page).to have_content "funny"
  end
end
