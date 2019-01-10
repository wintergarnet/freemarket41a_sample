class User < ApplicationRecord


  validates :telephone, acceptance: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :items
  has_many :purchases
  has_one :address
  has_one :birth
  has_one :credit

  validates :nickname, presence: true

end

