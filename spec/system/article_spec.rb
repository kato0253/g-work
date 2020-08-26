require 'rails_helper'
RSpec.describe '​記事投稿機能', type: :system do

  #   describe '記事投稿' do
  #   visit user_session_path
  #   fill_in 'user_email', with: "sample10@example.com"
  #   fill_in 'user_password', with: "00000000"
  #   click_on '送信'
  #   visit articles_path
  #   click_link '新規投稿'
  #   fill_in　'タイトル', with: "a"
  # 　fill_in　'内容', with: "a"
  # 　click_on '登録'
  # 　expect(page).to have_content '作成'
  #   end
    scenario "記事投稿テスト" do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:admin_user)

    # FactoryBot.create(:article, id: 5, user: @user1)

    visit user_session_path
    fill_in 'user_email', with: "sample10@example.com"
    fill_in 'user_password', with: "00000000"
    click_on '送信'
    visit articles_path
    click_link '新規投稿'
    fill_in "article[title]", with: 'rspec1'
    fill_in "article[content]", with: 'rspec2'
    click_on '登録'
    expect(page).to have_content 'rspec1'
    expect(page).to have_content 'rspec2'
end
scenario "マイページ遷移テスト" do
  @user1 = FactoryBot.create(:user)
  @user2 = FactoryBot.create(:admin_user)
  visit user_session_path
  fill_in 'user_email', with: "sample10@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  click_link 'マイページ'
  expect(page).to have_content 'Name'
end
end
RSpec.describe '​記事編集・削除機能', type: :system do
scenario "編集テスト" do
  @a = FactoryBot.create(:user,name:'a',email:"sample101@example.com",password:"00000000")
  FactoryBot.create(:article, id: 25 ,title:"rsepec1", content: "rspec2",user: @a)
  visit user_session_path
  fill_in 'user_email', with: "sample101@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  click_link '編集'
  fill_in 'article[title]', with: 'rsepec1'
  fill_in 'article[content]', with: 'rspec2'
  click_on '登録'
  expect(page).to have_content '編集しました！'
end
scenario "削除テスト" do
  @a = FactoryBot.create(:user,name:'a',email:"sample101@example.com",password:"00000000")
  FactoryBot.create(:article, id: 25 ,title:"rsepec1", content: "rspec2",user: @a)
  visit user_session_path
  fill_in 'user_email', with: "sample101@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  click_link '削除'
  expect(page).to have_content 'コメントが削除されました'
end
end
RSpec.describe '​お気に入り・お気に入り一覧表示・リンク機能', type: :system do
scenario "お気に入りテスト" do
  @a = FactoryBot.create(:user,name:'a',email:"sample101@example.com",password:"00000000")
  @b = FactoryBot.create(:user,id: 30,name:'b',email:"sampleb@example.com",password:"00000000")
  FactoryBot.create(:article, id: 26 ,title:"rsepec3", content: "rspec4",user: @b)
  visit user_session_path
  fill_in 'user_email', with: "sample101@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  # all('tbody tr')[1].click_link 'Edit'
  # all('tbody td')[1].click_link '詳細'
  click_link '詳細', match: :first
  click_link 'お気に入りする'
  expect(page).to have_content '記事をお気に入り登録しました'
end
scenario "お気に入り一覧表示テスト" do
  @a = FactoryBot.create(:user,name:'a',email:"sample101@example.com",password:"00000000")
  @b = FactoryBot.create(:user,id: 30,name:'b',email:"sampleb@example.com",password:"00000000")
  FactoryBot.create(:article, id: 26 ,title:"rsepec3", content: "rspec4",user: @b)
  visit user_session_path
  fill_in 'user_email', with: "sample101@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  click_link '詳細', match: :first
  click_link 'お気に入りする'
  click_link 'お気に入り一覧'
  expect(page).to have_content 'お気に入り一覧'
end
scenario "お気に入りリンク機能テスト" do
  @a = FactoryBot.create(:user,name:'a',email:"sample101@example.com",password:"00000000")
  @b = FactoryBot.create(:user,id: 30,name:'b',email:"sampleb@example.com",password:"00000000")
  FactoryBot.create(:article, id: 26 ,title:"rsepec3", content: "rspec4",user: @b)
  visit user_session_path
  fill_in 'user_email', with: "sample101@example.com"
  fill_in 'user_password', with: "00000000"
  click_on '送信'
  visit articles_path
  click_link '詳細', match: :first
  click_link 'お気に入りする'
  click_link 'お気に入り一覧'
  click_on 'rsepec3'
  expect(page).to have_content '詳細画面'
end
end
