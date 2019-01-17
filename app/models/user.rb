class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :nickname, presence: true
  # validates :telephone, acceptance: true

  has_many :comments
  has_many :items
  has_many :purchases
  has_one :address, :dependent => :destroy
  accepts_nested_attributes_for :address
  has_one :birth
  has_one :credit

  def self.from_omniauth(auth)

    user = User.where(email: auth.info.email).first
    return user if user
      user = User.create(email: auth.info.email, provider: auth.provider,
        uid: auth.uid, nickname: auth.info.name, password: Devise.friendly_token[0,20])
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

