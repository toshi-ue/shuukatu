class Item < ActiveRecord::Base
  # tops#index
  scope :latest_5_items, -> (genre_id){
    if genre_id == nil
      order(updated_at: :desc)
      .limit(5)
    else
      where(genre_id: genre_id)
      .order(updated_at: :desc)
      .limit(5)
    end
  }

  # items#show
  scope :get_item, -> (itemName){
    find_by(itemName: itemName)
  }

  # uploader
  mount_uploader :mainImage, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader

  # relation
  # belongs_to :approvalitem
  has_many :cartitems
  has_many :orders, through: :cartitems
  # has_many :reviews, through: :cartitems
  has_many :reviews
  belongs_to :genre
  belongs_to :subgenre
  belongs_to :brand
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  accepts_nested_attributes_for :reviews


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
