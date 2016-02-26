require 'rails_helper'

RSpec.feature "Admin can edit a category" do
  scenario "they see the page for the individual category" do
    admin = User.create(username: "david",
                          password: 'password',
                          role: 1
                          )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    category = Category.create(name: "lols")

    visit admin_categories_path

    click_on "#{category.name}"

    expect(current_path).to eq(edit_admin_category_path(category))

    click_on "Edit"

    fill_in "category_name", with: "food"
    click_on "Edit Category"

    expect(current_path).to eq(admin_category_path(category))
    expect(page).to have_content "food"
    expect(page).to not_have_content "lols"
  end
end
