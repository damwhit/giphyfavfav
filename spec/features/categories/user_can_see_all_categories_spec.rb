require 'rails_helper'

RSpec.feature "User can view all categories" do
  scenario "they see the page for all categories" do

    categories = %w(funny silly crazy).map do |category_name|
      Category.create(name: category_name)
    end

    visit categories_path

    categories.each do |category|
      expect(page).to have_link category.name, href: category_path(category)
    end

  end
end
