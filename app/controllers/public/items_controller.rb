class Public::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @genres = Genre.includes(:subgenres)
  end
end
