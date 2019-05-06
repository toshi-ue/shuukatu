class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: %i[show]

  def index
    order_ids = current_user.orders

    if order_ids.present?
      @review_count = 0
      @reviews = current_user.reviews.includes(:item)
      order_ids = current_user.orders.pluck(:id)
      ordered_items_ids = Cartitem.where(order_id: order_ids).order(created_at: :desc).distinct.pluck(:item_id)
      @orderd_items = Item.where(id: ordered_items_ids)

      @reviewed_flg = false
      # render json: @orderd_items
    end
    binding.pry
  end

  def show
    # binding.pry
  end

  def create
    @review = current_user.reviews.find_or_initialize_by(item_id: params[:review][:item_id])

    if @review.update_attributes(review_params)
      redirect_to reviews_path, success: "レビューが送信されました"
    else
      render 'show'
    end
  end

  def preview
  end

  private
  def review_params
    # params.require(:review).permit(:id, :item_id, :user_id, :score, :comment)
    params.require(:review).permit(%i[id item_id user_id score comment])
  end

  def set_review
    @review = current_user.reviews.find_or_initialize_by(item_id: params[:id])
  end
end
