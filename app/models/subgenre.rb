class Subgenre < ActiveRecord::Base
  # relation
  belongs_to :genre
  has_many :item

  # validation
  validates :name, presence: true
  validates :genre_id, presence: true
  # validates :approval_id, presence: true
end
