require 'rails_helper'

RSpec.describe ParentCategory, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a item_id,large_category, midium_category and small_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: 1,
          midium_category: 2,
          small_category: 3,
        )
        expect(parent_category).to be_valid
      end
    end
    context 'can not save' do
      it 'is invalid without large_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: nil,
          midium_category: 2,
          small_category: 3,
        )
        expect(parent_category).to_not be_valid
      end
      it 'is invalid without midium_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: 1,
          midium_category: nil,
          small_category: 3,
        )
        parent_category.valid?
        expect(parent_category).to_not be_valid
      end
      it 'is invalid without small_category' do
        parent_category = ParentCategory.new(
          item_id: 1,
          large_category: 1,
          midium_category: 2,
          small_category: nil,
        )
        parent_category.valid?
        expect(parent_category).to_not be_valid
      end
    end
  end
end
