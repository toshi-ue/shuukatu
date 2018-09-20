class Managers::SubgenresController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_subgenre, only:[:edit, :update, :destroy]

  def index
    @subgenres = Subgenre.all.reverse_order
  end

  def new
    @subgenre = Subgenre.new
  end

  def create
    @subgenre = Subgenre.create(subgenre_params)
    if @subgenre.save
      redirect_to managers_subgenres_path, success: "#{@subgenre.name}が登録されました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @subgenre.update(genre_params)
      redirect_to managers_subgenres_path, success: "サブジャンルの変更が完了しました"
    else
      render 'edit'
    end
  end

  def destroy
    @subgenre.destroy
      redirect_to managers_subgenres_path, success: "サブジャンル #{@subgenre.name} を削除しました"
  end

  private
  def subgenre_params
    params.require(:subgenre).permit(:name, :genre_id, :approval_id)
  end

  def set_subgenre
    @subgenre = Subgenre.find(params[:id])
  end
end
