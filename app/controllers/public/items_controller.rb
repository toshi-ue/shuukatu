class Public::ItemsController < ApplicationController

  def show
    # @item = Item.get_item(params[:item_name])
      @item = Item.includes(:genre).find(params[:id])
      @genres = Genre.includes(:subgenres)
    # if user_signed_in?

    #   @ = Like.find_by(item_id: @item.id, user_id: current_user.id)
    #   @like_status =
    #   "like" : "normal"
    # end
  end
end
