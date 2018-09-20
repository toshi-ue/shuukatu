class Approval < ActiveRecord::Base

  # relation
  has_many :approvalitems
  has_many :approvalbrands
end
