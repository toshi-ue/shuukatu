class Public::Settings::CreditsController < ApplicationController
  before_action :authenticate_user!


  def index
    @credits = Credit.where(user_id: current_user.id)

  end

  def show

  end

  def new
    @credit = Credit.new
  end

  def create
    binding.pry
    Payjp.api_key = ENV['payjp_test_private_key']

    #トークン作成
    token = Payjp::Token.create(
      user_id: current_user.id,
      card: {
        number: params[:number],
        cvc: params[:cvc],
        exp_month: params[:exp_month],
        exp_year: params[:exp_year],
        name: params[:name]
      }
    )
    Payjp::Customer.create(card: token.id)

    @credit = Credit.new(credit_params)
    @credit.user_id = current_user.id
    @credit.customer_id = token.id

    if @credit.save
      redirect_to credits_path, success: "登録ができました"
    else
      binding.pry
      # ここの処理はどのようにすればいいのか?
    end

    # カードエラー発生時
    rescue Payjp::CardError
      binding.pry
      render 'new'
    # end

  end

  def edit

    @submit = "更新"
  end

  def update

  end

  def destroy
    @credit.destroy
    redirect_to credits_path, success: "削除しました"
  end

  private
  def credit_params
    params.permit(:credit).permit(:user_id, :customer_id)
  end
end
