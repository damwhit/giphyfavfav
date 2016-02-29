class AddUserIdToFavoriteGifs < ActiveRecord::Migration
  def change
    add_reference :favorite_gifs, :user, index: true, foreign_key: true
  end
end
