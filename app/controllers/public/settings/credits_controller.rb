class Public::Settings::CreditsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key, only:[:index, :show, :create, :destroy]
  before_action :get_payjp_customer, except:[:new]

  # controllers/concern/credits_toshort
  include CreditsToshort

  def index
    get_cards
  end

  # パラメーター確認用
  # def show
  #   get_payjp_customer
  #   render json: @customer
  # end

  def new
    @credit = Credit.new
    @submit = '登録する'
  end

  def create
    # カードトークン作成
    associate_payjp_customer_and_token
    redirect_to settings_credits_path, success:'クレジットカードの登録が完了しました'

    # カードエラー発生時
    rescue Payjp::CardError
      # binding.pry
      @submit = '登録する'
      flash.now[:danger] = "入力情報に誤りがあります。もう一度入力し直してください"
      render 'new'
  end

  def destroy
    get_card(params[:id])
    @card.delete
    redirect_to settings_credits_path, success:'クレジットカード情報を削除しました'
  end
end
