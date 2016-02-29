require 'rails_helper'
require 'apicall'

RSpec.feature "user can view all favorited gifs" do
  context "user favorites a gif" do
    scenario "they can see all fav gifs sorted by category" do
      APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }
      login_user
      user = User.find_by(username: "July")

      cat = Category.create(name: "lolololololol")
      gif = cat.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

      visit gif_path(gif)

      click_on "favfav dis gif"

      expect(current_path).to eq(user_favorites_path(user.id))
      save_and_open_page
      expect(page).to have_content "lolololololol"
      expect(page).to have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")
    end
  end

  context "user unfavorites a gif" do
    scenario "user does not see unfavorited gif" do
      pending
      APICall.stub(:image_path) { "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif" }
      login_user

      cat = Category.create(name: "lolololololol")
      gif = cat.gifs.create(image_path: "https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif")

      visit gif_path(gif)

      click_on "favfav dis gif"
      expect(current_path).to eq(favorites_path)

      click_on "#{gif.image_path}"
      click_on "fogetaboutit"

      expect(current_path).to eq(favorites_path)

      expect(page).to_not have_content "lolololololol"
      expect(page).to_not have_css("img[src='https://media.giphy.com/media/7e0EvlBD7nxZu/giphy.gif']")


    end
  end
end
