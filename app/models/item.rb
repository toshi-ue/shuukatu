class Item < ActiveRecord::Base
  # uploader
  mount_uploader :mainImage, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  # relation
  has_many :orders, through: :cartitems
  belongs_to :genre
  belongs_to :subgenre
end
