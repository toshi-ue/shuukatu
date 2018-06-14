class Public::TopsController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(6)
    @genre1Items = Item.where(genre_id: 1).order(updated_at: :desc).limit(6)
    @genre2Items = Item.where(genre_id: 2).order(updated_at: :desc).limit(6)
    @genre3Items = Item.where(genre_id: 3).order(updated_at: :desc).limit(6)
  end

  def company
  end
end
