class Public::ItemsController < ApplicationController
  # before_action :set_item, only: [:index]

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    # binding.pry
  end

  private
  # def set_item
  #   @item = Item.find(params[:id])
  #   binding.pry
  # end

end
