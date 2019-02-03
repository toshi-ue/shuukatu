class Public::Orders::CreditsController < ApplicationController
  # before_action :set_api_key, only:[:index, :create]

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

    card_token = Payjp::Customer.retrieve(current_user.credit.customer_id).cards.data.last.id
    # render json: @payjp_customer
    redirect_to new_order_path(card_token: card_token), success: "クレジットカードを登録しました"

  rescue Payjp::CardError
    @submit = '登録する'
    flash.now[:danger] = "入力情報に誤りがあります。もう一度入力し直してください"
    render 'new'
  end
end
