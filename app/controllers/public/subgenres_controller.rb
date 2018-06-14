class Public::SubgenresController < ApplicationController
  def show
    @items =Item.where(genre_id: params[:genre_id], subgenre_id: params[:subgenre_id]).page(params[:page]).per(20)
    @genres = Genre.all
    # binding.pry
  end
end
