class Public::TopsController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(4)
  end

  def company
  end
end
