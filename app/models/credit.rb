class Credit < ActiveRecord::Base

  #relation
  belongs_to :user
  has_one   :order

  # def save_customer_token
  #   set_api_key

  # end

  # def set_api_key
  #   Payjp.api_key = ENV['payjp_test_private_key']
  # end

end
