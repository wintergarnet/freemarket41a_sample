class Item < ApplicationRecord
  has_one :value
  accepts_nested_attributes_for :value, allow_destroy: true

  mount_uploader :image, ImageUploader

  belongs_to :user
end
