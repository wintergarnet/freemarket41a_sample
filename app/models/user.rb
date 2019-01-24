class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :nickname, presence: true

  has_many :comments
  has_many :items
  has_many :purchases
  has_one :address
  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
  has_one :credit

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

end

