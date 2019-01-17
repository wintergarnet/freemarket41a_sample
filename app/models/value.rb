class Value < ApplicationRecord
  belongs_to :item,optional: true, dependent: :destroy, autosave: true

  validates :price, presence: true
  validates :profit, presence: true
end
