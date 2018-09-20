class Public::TopsController < ApplicationController
  def index
    @newItems = Item.order(updated_at: :desc).limit(5)
    @genre1Items = Item.where(genre_id: 1).order(updated_at: :desc).limit(5)
    @genre2Items = Item.where(genre_id: 2).order(updated_at: :desc).limit(5)
    @genre3Items = Item.where(genre_id: 3).order(updated_at: :desc).limit(5)
  end

  def company
  end

  def search
    @genres = Genre.includes(:subgenres)
    # @q = Item.ransack(params[:q])
    if params[:q]["itemName_or_itemCodeNo_or_price_or_genre_id_cont"].blank?
      redirect_to root_path, warning: "検索したい内容を再度確認して入力してください"
    else
      @items = @q.result
    end
  end

  private
  def search_params
    params.require(:q).permit!
  end
end
