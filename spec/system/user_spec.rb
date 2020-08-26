require 'rails_helper'
RSpec.describe '​ユーザ登録・ログイン・ログアウト機能​・管理画面テスト', type: :system do
  # background do
  # @user1 = FactoryBot.create(:user)
  # @user2 = FactoryBot.create(:admin_user)
  #
  #    visit user_session_path
  #    fill_in 'user_email', with: 'sample10@example.com'
  #    fill_in 'user_password', with: '00000000'
  #    click_on '送信'
  # end
  describe '​ユーザ登録のテスト​' do
    context '​ユーザのデータがなくログインしていない場合​' do
      it '​ユーザ新規登録のテスト​' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'name'
        fill_in 'user_email', with: 'sample@example.com'
        fill_in 'user_password', with: '00000000'
        fill_in 'user_password_confirmation', with: '00000000'
        click_on '送信'
        expect(page).to have_content '一覧'
      end
    end
  end
  before do
    visit new_user_registration_path
    fill_in 'user_name', with: 'name2'
    fill_in 'user_email', with: 'sample2@example.com'
    fill_in 'user_password',  with: '00000000'
    fill_in 'user_password_confirmation', with: '00000000'
    click_button '送信'
  end
  describe '​ログインのテスト​' do
    context '​ユーザ登録が有りログインする場合​' do
      it '​ユーザログインのテスト​' do
        visit user_session_path
        fill_in 'user_email', with: 'sample2@example.com'
        fill_in 'user_password', with: '00000000'
        click_on '送信'
        expect(page).to have_content '一覧'
      end
    end
  end
  describe '​ログアウトのテスト​' do
    context '​ログインしておりログアウトする場合​' do
      it '​ユーザログアウトのテスト​' do
        visit user_session_path
        fill_in 'user_email', with: 'sample2@example.com'
        fill_in 'user_password', with: '00000000'
        click_on '送信'
        visit articles_path
        click_on 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe '​管理機能のテスト​' do
    before { FactoryBot.create(:admin_user) }
    # before { @user2 = create(:admin_user) }
    context '​管理者でログインする場合​' do
      it '​管理者ログインのテスト​' do
        visit user_session_path
        fill_in 'user_email', with: 'admin11@example.com'
        fill_in 'user_password', with: '00000000'
        click_on '送信'
        visit articles_path
        click_link '管理者画面'
        expect(page).to have_content 'サイト管理'
      end
    end
    context "一般ユーザーでログインしている場合" do
      it "一般ユーザは管理画面にアクセスできないこと" do
        FactoryBot.create(:user)
        visit user_session_path
        fill_in 'user_email', with: "sample10@example.com"
        fill_in 'user_password', with: "00000000"
        click_on '送信'
        visit rails_admin_path
        # save_and_open_page
        expect(page).to have_content "You are not authorized"
      end
    end
  end
end

# RSpec.describe '​', type: :system do
#
#
#
#
#
# end
# context "管理者でログインしている場合" do
#   before {
#     FactoryBot.create(:admin_user)
#     visit user_session_path
#     fill_in 'user_email', with: "admin11@example.com"
#     fill_in 'user_password', with: "00000000"
#     visit rails_admin_path
#     visit new_user_registration_path
#     fill_in 'user_name', with: 'admin'
#     fill_in 'user_email', with: 'admin11@example.com'
#     fill_in 'user_password',  with: '00000000'
#     fill_in 'user_password_confirmation', with: '00000000'
#     click_on '送信'
#     save_and_open_page
#   }

#     it "管理者はユーザを新規登録できること" do
#       visit rails_admin_path
#       fill_in 'user_email', with: "admin11@example.com"
#       fill_in 'user_password', with: "00000000"
#       # save_and_open_page
#       click_on '送信'
#       click_link '管理者画面'
#       page.first(".a").click
#       # click_link "ユーザー"　
#       page.first(".content").click
#       # click_link "新規作成"
#       # <div class="col-sm-10 controls"><input value="" class="form-control" required="required" size="50" type="text" name="user[email]" id="user_email">
#       #<span class="help-block">必須. 最大文字数: 255.</span></div>
#       # page.first(".form-control").click
#       save_and_open_page
#       fill_in "user[email]", with: "sample200@example.com"
#       fill_in "user[password]", with: "00000000"
#       fill_in "user[password_confirmation]", with: "00000000"
#       fill_in "user[name]", with: "sample20"
#       select 'Profile image', from: 'スクリーンショット 2020-08-24 1.48.09'
#       click_on '保存'
#       expect(page).to have_content "ユーザーの作成に成功しました"
#     end
#   end
