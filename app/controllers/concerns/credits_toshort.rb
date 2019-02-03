module CreditsToshort
  extend ActiveSupport::Concern

  # payjp
  def get_payjp_customer
    credit = Credit.find_by(user_id: current_user.id)
    if credit.present?
      @payjp_customer = Payjp::Customer.retrieve(credit.customer_id)
    else
      @payjp_customer = nil
    end

    return @payjp_customer
  end

  def get_card(card_token)
    @card = @payjp_customer.cards.retrieve(card_token)
  end

  def get_cards
    if  @payjp_customer.present?
      if @payjp_customer.cards.count != 0
        @cards = []
        (@payjp_customer.cards.data).each_with_index do |card, i|
          @cards[i] = {
            'brand'=>(card.brand).to_s,
            'last4'=>(card.last4).to_s,
            'card_token'=>(card.id).to_s,
            'exp_month'=>(card.exp_month).to_s,
            'exp_year'=>(card.exp_year).to_s
          }
        end
      else
        @cards = nil
      end
    else
      @cards = nil
    end

    return @cards
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
    if @payjp_customer.blank?
      create_payjp_customer
    end
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

  private
  def credit_params
    params.permit(:credit).permit(:user_id, :customer_id, :card_token)
  end

  def set_api_key
    Payjp.api_key = ENV['payjp_test_private_key']
  end
end
