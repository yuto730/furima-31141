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
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
  end

  PRICE_REGEX = /\A[0-9]+\z/
  validates_format_of :price, with: PRICE_REGEX
end
