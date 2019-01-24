class Item < ApplicationRecord
  has_one :value
  has_one :parent_category
  accepts_nested_attributes_for :value, allow_destroy: true
  accepts_nested_attributes_for :parent_category, allow_destroy: true

  enum status: {"出品中": 0, "出品停止": 1, "取引中": 2, "売却済み": 3}

  mount_uploader :image, ImageUploader

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
