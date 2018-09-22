class Genre < ActiveRecord::Base
  # relation
  has_many :items
  has_many :subgenres

  # validation
  validates :name, presence: true
  # validates :approval_id, presence: true

end
