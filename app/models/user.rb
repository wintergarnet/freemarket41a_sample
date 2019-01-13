class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :telephone, acceptance: true

  has_many :comments
  has_many :items
  has_many :purchases
  has_one :address
  has_one :birth
  has_one :credit

end

