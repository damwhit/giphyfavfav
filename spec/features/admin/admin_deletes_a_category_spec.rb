require 'rails_helper'

RSpec.feature "Admin can delete a category" do
  scenario "they see the index page without the deleted category" do
    admin = User.create(username: "david",
                          password: 'password',
                          role: 1
                          )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    category = Category.create(name: "lols")

    visit admin_categories_path

    click_on "#{category.name}"

    expect(current_path).to eq(admin_category_path(category))

    click_on "Delete"

    expect(current_path).to eq(admin_categories_path)

    expect(page).to not_have_content "lols"

  end
end
