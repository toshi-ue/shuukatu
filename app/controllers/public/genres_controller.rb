class Public::GenresController < ApplicationController

  def show
    @items = Item.where(genre_id: params[:id]).page(params[:page]).per(20)
    # binding.pry
  end

end
