class Public::ItemsController < ApplicationController

  def show
    @item = Item.get_item(params[:item_name])
    @genres = Genre.includes(:subgenres)
  end
end
