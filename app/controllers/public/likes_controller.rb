class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @likes = current_user.likes.includes(:item)
  end

  def create
    @item = Item.find(params[:item_id])
    # binding.pry
    unless @item.loved?(current_user)
      @item.love(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end

  end

  def destroy
    @item = Like.find(params[:id]).item
    if @item.loved?(current_user)

      # binding.pry
      @item.unlove(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
