require 'rails_helper'

describe Value do
  describe '#create' do
    context 'can save' do
      it 'is valid with a item_id,price and profit' do
        value = Value.new(
          item_id: 1,
          price: 9000,
          profit: 8100,
        )
        expect(value).to be_valid
      end
    end
    context 'can not save' do
      it 'is invalid without price' do
        value = Value.new(
          item_id: 1,
          price: nil,
          profit: 8100,
        )
        expect(value).to_not be_valid
      end
      it 'is invalid without profit' do
        value = Value.new(
          item_id: 1,
          price: 9000,
          profit: nil,
        )
        value.valid?
        expect(value).to_not be_valid
      end
    end
  end
end
