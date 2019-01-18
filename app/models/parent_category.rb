class ParentCategory < ApplicationRecord
  belongs_to :item,optional: true, dependent: :destroy, autosave: true

  validates :large_category, presence: true
  validates :midium_category, presence: true
  validates :small_category, presence: true
end
