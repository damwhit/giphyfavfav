require 'rails_helper'

RSpec.feature "User can edit a category" do
  scenario "they see the page for the individual category" do
    pending
    category = Category.create(name: "lols")

    visit categories_path
    # save_and_open_page

    click_on "lols"

    click_on "Edit Category"
    expect(current_path).to eq(edit_category_path(category))

    click_on "Edit"

    fill_in "category_name", with: "food"
    click_on "Edit Category"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content "food"
    expect(page).to not_have_content "lols"
  end
end
