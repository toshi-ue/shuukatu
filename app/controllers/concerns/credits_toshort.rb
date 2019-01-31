=begin
TODOS
このconcern自体の削除を検討する
=end
module CreditsToshort
  extend ActiveSupport::Concern

  def get_cards_info(customer_id)
    # binding.pry
    infos = Payjp::Customer.retrieve(customer_id)
    (infos.cards.data).each_with_index do |info, i|
      @cards[i] = {'brand'=>(info.brand).to_s, 'last4'=>(info.last4).to_s, 'card_token'=>(info.id).to_s, 'exp_month'=>(info.exp_month).to_s, 'exp_year'=>(info.exp_year).to_s}
    end
  end

  def create_card_token

    token = Payjp::Token.create(
      :card => {
        number: params[:number],
        cvc: params[:cvc],
        exp_month: params[:exp_month],
        exp_year: params[:exp_year],
        name: params[:name]
      }
    )
  end

  def create_card_token
    @token = create_card_token.id
    if Credit.where(user_id: current_user.id).blank?
      # 顧客トークン作成
      # binding.pry
      @customer = Payjp::Customer.create(card: @token)
      @credit = Credit.new(credit_params)
      @credit.user_id = current_user.id
      @credit.customer_id = @customer.id
      @credit.save
    else
      set_customer
      # 顧客トークンとカードトークンの紐付け
      @customer.cards.create(card: @token)
    end
  end

end
