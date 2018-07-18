class Order < ActiveRecord::Base

  # pagination
  paginates_per 20

  #relation
  belongs_to :user
  belongs_to :address
  belongs_to :dvendor
  has_many :cartitems
  has_many :items, through: :cartitems

  #validation
  validates :order_no, presence: true
  validates :user_id, presence: true
  validates :address_id, presence: true
  validates :dvendor_id, presence: true, on: :update
  validates :d_number, length: {in: 10..13}, on: :update
end
