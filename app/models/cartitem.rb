class Cartitem < ActiveRecord::Base
  #relation
  belongs_to :user
  belongs_to :item
  belongs_to :order
  has_many :user, through: :orders
end
