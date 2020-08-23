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
