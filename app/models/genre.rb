class Genre < ActiveRecord::Base
  # relation
  has_many :items
  has_many :subgenres
end
