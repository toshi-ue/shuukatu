class Review < ActiveRecord::Base

  # relation
  belongs_to :user
  belongs_to :item

  # validation
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :item_id, presence: true
  validates :user_id, presence: true
  # validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
