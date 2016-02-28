require 'apicall'

class Admin::GifsController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def show
    @gif = Gif.find(params[:id])
    @category = @gif.category
  end

  def new
    @gif = Gif.new
  end

  def create
    @search_term = params[:search_term]
    @image_path = APICall.image_path
    @gif = Gif.new(image_path: @image_path)
    if @gif.save
      @category = Category.where(name: @search_term).first_or_create
      @category.gifs << @gif
      redirect_to @gif
    else
      render :new
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    redirect_to admin_gifs_path
  end
end
