require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '出品機能' do

    context '出品できるとき' do
      it '全ての値が正しく存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら出品できる' do
        @item.price = 6_999
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空だと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'conditionが未選択だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it 'shopping_charge_idが未選択だと出品できない' do
        @item.shopping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping charge Select")
      end
      it 'prefecturesが未選択だと出品できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures Select")
      end
      it 'day_to_shipが未選択だと出品できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship Select")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceの値が300未満だと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceの値が9_999_999より大きいと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end