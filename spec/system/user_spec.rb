require 'rails_helper'
RSpec.describe '​ユーザ登録・ログイン・ログアウト機能​・管理画面テスト', type: :system do

  describe '​ユーザ登録のテスト​' do
    context '​ユーザのデータがなくログインしていない場合​' do
      it '​ユーザ新規登録のテスト​' do
        visit new_user_registration_path
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: '00000000'
        fill_in 'user_password_confirmation', with: '00000000'
        click_on 'Sign up'
        expect(page).to have_content '作成する'
      end
    end
  end
end
