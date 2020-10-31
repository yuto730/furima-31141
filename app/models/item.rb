class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_one :order

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  end

  PRICE_REGEX = /\A[0-9]+\z/
  validates_format_of :price, with: PRICE_REGEX
end
