module CreditsToshort
  extend ActiveSupport::Concern

  def set_customer
    customer_id = Credit.find_by(user_id: current_user.id).customer_id
    @customer = Payjp::Customer.retrieve(customer_id)
    # binding.pry
  end

  def set_cards_info(customer_id)
    # binding.pry
    infos = Payjp::Customer.retrieve(customer_id)
    (infos.cards.data).each_with_index do |info, i|
      @cards[i] = {'brand'=>(info.brand).to_s, 'last4'=>(info.last4).to_s, 'card_token'=>(info.id).to_s, 'exp_month'=>(info.exp_month).to_s, 'exp_year'=>(info.exp_year).to_s}
    end
  end

  def set_card_token
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
    @token = set_card_token.id
    if Credit.where(user_id: current_user.id).blank?
      # 顧客トークン作成
      # binding.pry
      @customer = Payjp::Customer.create(card: @token)
      @credit = Credit.new(credit_params)
      @credit.user_id = current_user.id
      @credit.customer_id = @customer.id
      @credit.save
    else
      # 顧客トークンの取得
      set_customer
      # 顧客トークンとカードトークンの紐付け
      @customer.cards.create(card: @token)
    end
  end

  private
  def set_api_key
    Payjp.api_key = ENV['payjp_test_private_key']
  end

end
