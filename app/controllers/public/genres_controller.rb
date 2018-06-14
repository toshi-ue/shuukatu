class Public::GenresController < ApplicationController

  def show
    @items = Item.where(genre_id: params[:id])
  end

end
