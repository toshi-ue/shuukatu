class Managers::Position < ActiveRecord::Base

  # relation
  belongs_to :manager
end
