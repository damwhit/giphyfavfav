require 'rails_helper'

RSpec.feature "user can delete categories" do
  scenario "user does not see the deleted category" do
    create_and_stub_admin

    categories = %w(funny silly crazy).map do |category_name|
      Category.create(name: category_name)
    end

    visit admin_categories_path

    click_on "funny"

    click_on "Delete"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to_not have_content "funny"
    expect(page).to have_content "silly"
    expect(page).to have_content "crazy"
  end
end
