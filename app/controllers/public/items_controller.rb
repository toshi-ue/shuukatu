class Public::ItemsController < ApplicationController
  before_action :set_item, only: [:index]

  def show
    # @item = Item.find(params[:id])
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

end
