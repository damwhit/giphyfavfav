require 'rails_helper'

RSpec.feature "User can view a category" do
  scenario "they see the page for all categories" do
    login_user
    categories = %w(funny silly crazy).map do |category_name|
      Category.create(name: category_name)
    end

    visit categories_path
    click_on "crazy"

    expect(page).to have_content "crazy"
  end
end
