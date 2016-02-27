class GifsController < ApplicationController

  def index

  end

  def new
    @category = Category.new
    @gif = Gif.new
  end

end
