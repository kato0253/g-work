require 'rails_helper'
RSpec.describe 'バリデーション管理', type: :model do
  it 'titleが空ならバリデーション' do
    article = Article.new(title: '', content: '失敗')
    expect(article).not_to be_valid
  end
  it 'contentが空ならバリデーション' do
    article = Article.new(title: '失敗', content: '')
    expect(article).not_to be_valid
  end
  it 'titleとcontentに内容が記載無しなら、バリデーション' do
    article = Article.new(title: '', content: '')
    expect(article).not_to be_valid
  end
end

RSpec.describe 'バリデーション管理', type: :model do
  it 'emailが空ならバリデーション' do
    user = User.new(email:" ")
    expect(user).not_to be_valid
  end
  it 'emailが255文字以上ならバリデーション' do
    user = User.new(email: "a"*256+"@gmail.com",password:"000000")
    expect(user).not_to be_valid
  end
  it 'passwordが空ならバリデーション' do
    user = User.new(email: "a@gmail.com",password:"　")
    expect(user).not_to be_valid
  end
end

RSpec.describe 'バリデーション管理', type: :model do
  it 'contentが空ならバリデーション' do
    comment = Comment.new(content:" ")
    expect(comment).not_to be_valid
  end
end
