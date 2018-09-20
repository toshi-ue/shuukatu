class Managers::GenresController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_genre, only:[:edit, :update, :destroy]

  def index
    @genres = Genre.includes(:subgenres).reverse_order
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to managers_genres_path, success: "#{@genre.name}が登録されました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to managers_genres_path, success: "ジャンルの変更が完了しました"
    else
      render 'edit'
    end
  end

  def destroy
    @genre.destroy
    redirect_to managers_genres_path, success: "ジャンル #{@genre.name} を削除しました"
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :approval_id)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
