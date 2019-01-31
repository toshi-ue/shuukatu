class Public::Orders::CreditsController < ApplicationController
  before_action :set_api_key, only:[:index, :create]

  # controllers/concern/credits_toshort
  include CreditsToshort

  def index
    unless Credit.find_by(id: current_user.id).blank?
      set_customer
      @cards = @customer.cards.all
    else
      redirect_to public_orders_credits_new_path
    end
    render json: @cards
  end

  def new
    @credit = Credit.new
    @submit = '登録する'
  end

  def create
    get_payjp_customer
    associate_payjp_customer_and_token

    redirect_to new_order_path(card_token: @payjp_customer.default_card), success: "クレジットカードを登録しました"

  rescue Payjp::CardError
    @submit = '登録する'
    flash.now[:danger] = "入力情報に誤りがあります。もう一度入力し直してください"
    render 'new'
  end



  private
  def set_api_key
    Payjp.api_key = ENV['payjp_test_private_key']
  end

  def credit_params
    params.permit(:credit).permit(:user_id, :customer_id)
  end
end
