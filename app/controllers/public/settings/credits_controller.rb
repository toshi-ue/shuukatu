class Public::Settings::CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only:[:index, :show, :create, :destroy]

  # controllers/concern/credits_toshort
  include CreditsToshort

  def index
    @cards = []
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    unless customer_id.blank?
      # binding.pry
      set_cards_info(customer_id)
    end
    # render json:@cards
  end

  # パラメーター確認用
  def show
    set_customer
    render json: @customer
  end

  def new
    @credit = Credit.new
    @submit = '登録する'
  end

  def create
    # カードトークン作成
    create_card_token
    redirect_to settings_credits_path, success:'クレジットカードの登録が完了しました'

    # カードエラー発生時
    rescue Payjp::CardError
      # binding.pry
      @submit = '登録する'
      flash.now[:danger] = "入力情報に誤りがあります。もう一度入力し直してください"
      render 'new'
  end

  # 未実装
  def destroy
    # 顧客トークンの取得
    set_customer
    card = @customer.cards.retrieve(params[:id])
    card.delete
    redirect_to settings_credits_path, success:'クレジットカード情報を削除しました'
  end



  private
  def credit_params
    params.permit(:credit).permit(:user_id, :customer_id)
  end

  # def set_api_key
  #   Payjp.api_key = ENV['payjp_test_private_key']
  # end
end
