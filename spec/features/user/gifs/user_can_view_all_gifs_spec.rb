require 'rails_helper'
require 'apicall'

RSpec.feature "user can view all gifs" do
  scenario "they can see all gifs sorted by category" do
    APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }
    login_user
    categories = %w(funny silly crazy).map do |category|
      cat = Category.where(name: category).first_or_create
      cat.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")
      cat
    end

    visit gifs_path

    categories.each do |category|
      within("#category-#{category.id}") do
        expect(page).to have_content category.name
        category.gifs.each do |gif|
          expect(page).to have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")
        end
      end
    end
  end
end
