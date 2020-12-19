require 'rails_helper'


describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name,last_name_kana、first_name_kana、birthdayが存在すればOK" do
        expect(@user).to be_valid
      end
      it '重複したemailがなければOK' do
        @user.email = 'aaa@test'
        another_user = FactoryBot.build(:user)
        another_user.email = 'aaa@kakunin'
        expect(another_user).to be_valid
      end
      it 'emailに@があればOK' do
        @user.email = "aaa@test"
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上ならOK' do
        @user.password = 'aaa123aaa'
        @user.password_confirmation = 'aaa123aaa'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数ならOK' do
        @user.password = 'aaa123aaa'
        @user.password_confirmation = 'aaa123aaa'
        expect(@user).to be_valid
      end
      it 'password_confirmationがpasswodと同じならOK' do
        @user.password = "123abcdef"
        @user.password_confirmation = "123abcdef"
        expect(@user).to be_valid
      end
      it 'last_nameが全角ならOK' do
        @user.last_name = "は葉ハ"
        expect(@user).to be_valid
      end
      it 'first_nameが全角ならOK' do
        @user.first_name = "は葉ハ"
        expect(@user).to be_valid
      end
      it 'last_name_kanaがカタカナならOK' do
        @user.last_name_kana = "ハハハ"
        expect(@user).to be_valid
      end
      it 'first_name_kanaがカタカナならOK' do
        @user.first_name_kana = "ハハハ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がないと登録できない' do
        @user.email = "aaaatest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = "abc123c"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end  
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが半角なら登録できない' do
        @user.first_name_kana = "ｱｲｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'last_name_kanaが半角なら登録できない' do
        @user.last_name_kana = "ｱｲｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
    end
  end
end