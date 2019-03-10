class Public::ItemsController < ApplicationController

  def show
    # @item = Item.get_item(params[:item_name])
    @item = Item.find(params[:id])
    @genres = Genre.includes(:subgenres)
  end
end
