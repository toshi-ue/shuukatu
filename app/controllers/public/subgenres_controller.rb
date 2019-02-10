class Public::SubgenresController < ApplicationController
  include CreditsToshort
  include GenresToshort
  before_action :set_genres

  def show
    @items =Item.includes(:genre, :subgenre).where(subgenre_id: params[:id]).page(params[:page]).per(20)
  end
end
