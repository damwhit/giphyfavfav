class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = @user.gifs
  end

  def create
    @gif = Gif.find(params[:gif_id])
    @user = current_user
    @favorites = @user.gifs << @gif
    redirect_to user_favorites_path
  end
end
