class User < ApplicationRecord


  validates :telephone, acceptance: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :comments
  has_many :items
  has_many :purchases
  has_one :address
  has_one :birth
  has_one :credit

end

