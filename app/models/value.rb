class Value < ApplicationRecord
  belongs_to :item,optional: true, dependent: :destroy, autosave: true
end
