class Item < ApplicationRecord
  has_one :value
  has_one :parent_category
  accepts_nested_attributes_for :value, allow_destroy: true
  accepts_nested_attributes_for :parent_category, allow_destroy: true

  mount_uploader :image, ImageUploader

  scope :sold, -> { where('status = "売却済み"') }
  scope :exhibition, -> { where('status = ? or status = ?', "出品中","出品停止") }
  scope :trade, -> { where('status = "取引中"') }

  belongs_to :user

  validates :status, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :item_condition, presence: true
  validates :ship_from, presence: true
  validates :delivery_fee, presence: true
  validates :pre_date, presence: true

end
