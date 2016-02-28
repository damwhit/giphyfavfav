require 'rails_helper'

RSpec.feature "Admin can view all categories" do
  scenario "they see the page for all categories" do
    create_and_stub_admin
    categories = %w(funny silly crazy).map do |category_name|
      Category.create(name: category_name)
    end

    visit admin_categories_path

    categories.each do |category|
      expect(page).to have_link category.name, href: admin_category_path(category)
    end
  end
end
