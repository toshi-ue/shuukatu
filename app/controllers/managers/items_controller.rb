class Managers::ItemsController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_item, only:[:edit, :update, :destroy]

  def index
    @items = Item.all.page(params[:page]).per(20).reverse_order
  end

  def show
    @items = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to managers_items_path, success: "#{@item.itemName}が登録されました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to managers_items_path, success: "#{@item.itemName}が更新されました"
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to managers_items_path, success: "#{@item.itemName}を削除しました"
  end

  private
  def item_params
    params.require(:item).permit(:id, :itemCodeNo, :partNumber, :itemName, :genre_id, :subgenre_id, :price, :description, :attention, :mainImage, :image2, :image3)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
