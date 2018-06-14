class Public::TopsController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(5)
    @genre1Items = Item.where(genre_id: 1).order(updated_at: :desc).limit(5)
    @genre2Items = Item.where(genre_id: 2).order(updated_at: :desc).limit(5)
    @genre3Items = Item.where(genre_id: 3).order(updated_at: :desc).limit(5)
  end

  def company
  end
end
