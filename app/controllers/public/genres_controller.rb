class Public::GenresController < ApplicationController
  before_action :set_genres

  include GenresToshort

  def show
    @items = Item.includes(:genre, :subgenre).where(genre_id: params[:id]).page(params[:page]).per(20)
  end
end
