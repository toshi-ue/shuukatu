class Address < ActiveRecord::Base
  #relation
  belongs_to :user
  belongs_to :prefecture
  has_many :orders
end
