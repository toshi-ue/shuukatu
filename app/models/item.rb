class Item < ActiveRecord::Base
  # uploader
  mount_uploader :mainImage, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  # relation
  # belongs_to :approvalitem
  has_many :orders, through: :cartitems
  belongs_to :genre
  belongs_to :subgenre
  belongs_to :brand
  has_many :cartitems

  # validation
  # validates :brand_id, presence: true
  validates :itemCodeNo, presence: true,
             uniqueness: true,
             numericality: {only_integer: true, greater_than: 0}
  validates :partNumber, presence: true,
             uniqueness: true
  validates :itemName, presence: true,
             uniqueness: true
  validates :genre_id, presence: true
  validates :subgenre_id, presence: true
  validates :price, presence: true,
             numericality: {only_integer: true, greater_than: 0}
  validates :description, presence: true
  # validates :attention, presence: true
  validates :mainImage, presence: true

end
