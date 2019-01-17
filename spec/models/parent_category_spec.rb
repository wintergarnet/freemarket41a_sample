require 'rails_helper'

RSpec.describe ParentCategory, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a item_id,large_category and midium_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: 1,
          midium_category: 2,
        )
        expect(parent_category).to be_valid
      end
    end
    context 'can not save' do
      it 'is invalid without large_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: nil,
          midium_category: 2
        )
        expect(parent_category).to_not be_valid
      end
      it 'is invalid without midium_categoryt' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: 1,
          midium_category: nil,
        )
        parent_category.valid?
        expect(parent_category).to_not be_valid
      end
    end
  end
end
