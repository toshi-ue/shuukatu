class Public::TopsController < ApplicationController
  def index
    @newItems = Item.latest_5_items(nil)
    @genre1Items = Item.latest_5_items(1)
    @genre2Items = Item.latest_5_items(2)
    @genre3Items = Item.latest_5_items(3)
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
