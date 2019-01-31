class Credit < ActiveRecord::Base
  #relation
  belongs_to :user
  has_one   :order

  # validation
  validates :user_id, uniqueness: true
  validates :customer_id, presence: true
  # def save_customer_token

  # def set_api_key
  #   Payjp.api_key = ENV['payjp_test_private_key']
  # end

end
