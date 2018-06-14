class Public::SubgenresController < ApplicationController
  def show
    @items =Item.where(subgenre_id: params[:id])
  end
end
