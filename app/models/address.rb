class Address < ActiveRecord::Base
  #relation
  belongs_to :user
  belongs_to :prefecture
  has_many :orders

  #validation
  validates :user_name, presence: true
  validates :name_kana, presence: true
  validates :tel, presence: true, length: {in: 10..15}
  validates :postalcode, presence: true, length:{in: 7..8}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true

  # combine_columns
  def set_address_details
    self.street + self.others
  end

end
