class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :email
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  NAME_REGEX = /\A[ぁ−んァ−ンー-龥]/
  validates_format_of :first_name, with: NAME_REGEX
  validates_format_of :last_name, with: NAME_REGEX

  NAMEFURI_REGEX = /\A([ァ-ン]|ー)+\z/
  validates_format_of :first_name_kana, with: NAMEFURI_REGEX
  validates_format_of :last_name_kana, with: NAMEFURI_REGEX
end
