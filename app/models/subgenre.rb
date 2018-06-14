class Subgenre < ActiveRecord::Base
  # relation
  belongs_to :genre
  has_many :item
end
