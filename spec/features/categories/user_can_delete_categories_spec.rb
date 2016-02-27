require 'rails_helper'

RSpec.feature "user can delete categories" do
  scenario "user sees index page of all categories" do

    categories = %w(funny silly crazy).map do |category_name|
      Category.create(name: category_name)
    end

    visit categories_path

    click_on "funny"
    expect(current_path).to eq(category_path(categories.first))

    click_on "Delete"
    expect(current_path).to eq(categories_path)

    expect(page).to have_content("silly")
    expect(page).to have_content("crazy")
    expect(page).to_not have_content("funny")
  end
end
