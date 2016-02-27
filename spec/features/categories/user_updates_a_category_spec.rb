require 'rails_helper'

RSpec.feature "User can edit a category" do
  scenario "they see the page for the individual category" do
    category = Category.create(name: "lols")

    visit categories_path

    click_on "lols"

    click_on "Edit Category"
    expect(current_path).to eq(edit_category_path(category))

    fill_in "Name", with: "food"
    click_on "Edit"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content "food"
    expect(page).to_not have_content "lols"
  end
end
