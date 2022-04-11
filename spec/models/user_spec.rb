require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字混合であれば登録できる" do
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        expect(@user).to be_valid
      end
      it "last_name_kanaが全角カナであれば登録できる" do
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナであれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'パスワードが英語のみでは登録できない' do
          @user.password = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).not_to include('は半角英数を両方含む必要があります')
        end
        it 'パスワードが数字のみでは登録できない' do
          @user.password = '123456'
          @user.valid?
          expect(@user.errors.full_messages).not_to include('は半角英数を両方含む必要があります')
        end
        it 'パスワードが全角文字を含むと登録できない' do
          @user.password = 'AAA111'
          @user.valid?
          expect(@user.errors.full_messages).not_to include('は半角英数を両方含む必要があります')
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name kana 全角カタカナで入力して下さい")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name kana 全角カタカナで入力して下さい")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
      end
      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name kana 全角カタカナで入力して下さい")
      end
      it 'last_name_kanaが半角では登録できない' do
        @user.first_name_kana = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).not_to include("First name kana 全角カタカナで入力して下さい")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end