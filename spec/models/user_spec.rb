require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(nickname: 'Taro', email: 'taro@example', password: '000000', password_confirmation: '000000', familyname_kanji: '山田', firstname_kanji: '太郎', familyname_kana: 'ヤマダ', firstname_kana: 'タロウ', birthday: '2000年1月1日')
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it '名前が空では登録できない' do
      @user.familyname_kanji = ''
      @user.firstname_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kanji can't be blank", "Firstname kanji can't be blank")
    end
    
    it '名前（フリガナ）が空では登録できない' do
      @user.familyname_kana = ''
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kana can't be blank", "Firstname kana can't be blank")
    end

    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end