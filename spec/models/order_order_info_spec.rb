require 'rails_helper'

RSpec.describe OrderOrderInfo, type: :model do
  describe '購入の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:user)
      @order_order_info = FactoryBot.build(:order_order_info, user_id: @user.id, item_id: @item.id)
    end

    context '購入が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_order_info).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_order_info.building_name = ''
        expect(@order_order_info).to be_valid
      end
      it 'user_idがあれば保存できること' do
        @order_order_info.user_id = @user.id
        expect(@order_order_info).to be_valid
      end
      it 'item_idがあれば保存できること' do
        @order_order_info.item_id = @item.id
        expect(@order_order_info).to be_valid
      end
    end

    context '購入が保存できないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_order_info.postal_code = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @order_order_info.municipality = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_order_info.address = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_order_info.phone_number = ''
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'prefectures_idが未選択だと保存できない' do
        @order_order_info.prefectures_id = 1
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Prefectures Select")
      end
      it 'postal_codeにハイフンがなければ保存できない（123-4567）' do
        @order_order_info.postal_code = '1234567'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeは半角数字でなければ保存できない（123-4567）' do
        @order_order_info.postal_code = '１２３-４５６７'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'phone_numberは11桁以内でなければ保存できない（09012345678となる）' do
        @order_order_info.phone_number = '090123456789'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは半角数字でなければ保存できない（09012345678となる）' do
        @order_order_info.phone_number = '０９０１２３４５６７８'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberはハイフンがあると保存できない（09012345678となる）' do
        @order_order_info.phone_number = '090-123-567'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberは英数字混合では保存できない（09012345678となる）' do
        @order_order_info.phone_number = '090aaaa1111'
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Phone number Input only number")
      end
      it "tokenが空では保存できないこと" do
        @order_order_info.token = nil
        @order_order_info.valid?
        expect(@order_order_info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
