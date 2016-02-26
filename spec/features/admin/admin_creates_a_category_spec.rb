require 'rails_helper'

RSpec.feature "Admin creates a new Category" do
  scenario "they see the page for the individual category" do
    admin = User.create(username: "david",
                          password: 'password',
                          role: 1
                          )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    click_on "New category"
    fill_in "category_name", with: "lols"
    click_on "Create Category"

    expect(page).to have_content "lols"
  end
end
