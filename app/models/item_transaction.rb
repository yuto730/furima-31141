class ItemTransaction
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :number, :building, :phone_number, :order_id, :token

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :number
    validates :phone_number, length: { maximum: 11 }
    validates :order_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX
  PHONE_NUMBER_REGEX = /\A[0-9]+\z/
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, number: number, building: building, phone_number: phone_number, order_id: order.id)
  end
end