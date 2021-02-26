require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname/email/password/last_name/first_name/last_name_kana/first_name_kana/birthdayが全て正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上且つ、半角英数字が混合されていれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'emailは＠が含まれていれば登録できる' do
        @user.email = 'aaa@test.com'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'nakamura'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      it 'first_name名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'tomoya'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'Last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角（カタカナ）ではなく、全角(ひらがな)では登録できない' do
        @user.last_name_kana = 'なかむら'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width characters")
      end
      it 'last_name_kanaが全角（カタカナ）ではなく、全角(漢字)では登録できない' do
        @user.last_name_kana = '中村'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width characters")
      end
      it 'last_name_kanaが全角（カタカナ）ではなく、全角(英字)では登録できない' do
        @user.last_name_kana = 'ＮＡＫＡＭＵＲＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width characters")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角（カタカナ）ではなく、全角(ひらがな)では登録できない' do
        @user.first_name_kana = 'ともや'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width characters")
      end
      it 'first_name_kanaが全角（カタカナ）ではなく、全角(漢字)では登録できない' do
        @user.first_name_kana = '智也'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width characters")
      end
      it 'first_name_kanaが全角（カタカナ）ではなく、全角(英字)では登録できない' do
        @user.first_name_kana = 'ＴＯＭＯＹＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width characters")
      end
      it '重複するemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordはpassword_confirmationと値の一致しないと登録できない' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'abc000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ａａａ２２２'
        @user.password_confirmation = 'ａａａ２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
    end
  end
end
