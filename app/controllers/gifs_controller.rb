class GifsController < ApplicationController

  def index

  end

  def new
    @gif = Gif.new
  end

end
