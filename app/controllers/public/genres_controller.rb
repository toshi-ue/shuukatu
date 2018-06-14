class Public::GenresController < ApplicationController

  def show
    @genres = Genre.all
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(20)
    # binding.pry
  end

end
