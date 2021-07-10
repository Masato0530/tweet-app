require 'rails_helper'
 describe do
   before do
    @user = FactoryBot.build(:user)
   end
   describe 'ユーザー新規登録' do
     context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以内であれば登録できること' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end

      it 'nicknameが6文字以下では登録できること' do
        @user.nickname = "aaaaaaa"
        expect(@user).to be_valid
      end

      context '新規登録がうまく行かないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it "パスワードとパスワード（確認用)は値が一致しないと登録できないこと" do
          @user.password = '12345a'
          @user.password_confirmation = '12345b'
          @user.valid?        
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '11aaa'
          @user.password_confirmation = '11aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
      end
    end
  end
end
