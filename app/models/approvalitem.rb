class Approvalitem < ActiveRecord::Base
  # relation
  belongs_to :approval
  has_many :items
end
