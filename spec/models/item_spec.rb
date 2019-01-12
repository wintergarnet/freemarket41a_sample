require 'rails_helper'

describe Item do
  describe '#create' do
    context 'can save' do
      it 'is valid with status, name, image, description, item_condition, ship_from, delivery_fee, pre_date' do
        expect(build(:item)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without user_id' do
        item = build(:item, user_id: nil)
        item.valid?
        expect(item.errors[:user]).to include('を入力してください')
      end
      it 'is invalid without status' do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include('を入力してください')
      end
      it 'is invalid without name' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include('を入力してください')
      end
      it 'is invalid without image' do
        item = build(:item, image: nil)
        item.valid?
        expect(item.errors[:image]).to include('を入力してください')
      end
      it 'is invalid without description' do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include('を入力してください')
      end
      it 'is invalid without item_condition' do
        item = build(:item, item_condition: nil)
        item.valid?
        expect(item.errors[:item_condition]).to include('を入力してください')
      end
      it 'is invalid without ship_from' do
        item = build(:item, ship_from: nil)
        item.valid?
        expect(item.errors[:ship_from]).to include('を入力してください')
      end
      it 'is invalid without delivery_fee' do
        item = build(:item, delivery_fee: nil)
        item.valid?
        expect(item.errors[:delivery_fee]).to include('を入力してください')
      end
      it 'is invalid without pre_date' do
        item = build(:item, pre_date: nil)
        item.valid?
        expect(item.errors[:pre_date]).to include('を入力してください')
      end
    end


  end
end
