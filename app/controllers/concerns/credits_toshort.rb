module CreditsToshort
  extend ActiveSupport::Concern

  # payjp
  def get_cards_info(customer_id)
    # binding.pry
    infos = Payjp::Customer.retrieve(customer_id)
    (infos.cards.data).each_with_index do |info, i|
      @cards[i] = {'brand'=>(info.brand).to_s, 'last4'=>(info.last4).to_s, 'card_token'=>(info.id).to_s, 'exp_month'=>(info.exp_month).to_s, 'exp_year'=>(info.exp_year).to_s}
    end
  end

  def get_payjp_customer
    payjp_info = Credit.find_by(user_id: current_user.id)

    if payjp_info.present?
      @payjp_customer = Payjp::Customer.retrieve(payjp_info.customer_id)
    else
      create_payjp_customer
    end

    return @payjp_customer
  end

  def create_payjp_card_token
    @token = Payjp::Token.create({
        :card => {
          number: params[:number],
          cvc: params[:cvc],
          exp_month: params[:exp_month],
          exp_year: params[:exp_year],
          name: params[:name]
        }
      },
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
  end

  def create_payjp_customer
    @payjp_customer = Payjp::Customer.create(
      email: current_user.email,
    )
    @credit = Credit.new(credit_params)
    @credit.user_id = current_user.id
    @credit.customer_id = @payjp_customer.id
    @credit.save!
  end

  def associate_payjp_customer_and_token
    create_payjp_card_token
    @card_token = @token.id
    @customer = Payjp::Customer.retrieve(@payjp_customer.id)

    if @payjp_customer.cards.count == 0
      default_value = true
    else
      default_value = false
    end
    @customer.cards.create(
      card: @card_token,
      default: default_value
    )
  end

  def get_card_token
    if session[:order]['card_token'].blank?
      if @payjp_customer.default_card.present?
        @card_token = @payjp_customer.default_card
      else
        @card_token = @payjp_customer.cards.data.last
      end
    else
      @card_token = session[:order]['card_token']
    end

    return @card_token
  end
end
