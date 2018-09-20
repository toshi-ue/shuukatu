class Public::SubgenresController < ApplicationController
  def show
    @items =Item.where(subgenre_id: params[:id]).page(params[:page]).per(20)
    @genres = Genre.all
    # binding.pry
  end
end
