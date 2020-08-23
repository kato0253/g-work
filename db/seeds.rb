User.create!(
  name: "sample1",
  email: "sample1@example.com",
  password: '000000',
  admin: true,
)

  title  = "第0タイトル"
  content = "第0コンテンツ"
  Article.create!(
    title: title,
    content: content,
    user_id: 1,
)

User.create!(
  name: "sample2",
  email: "sample2@example.com",
  password: '000000',
  admin: false,
)

19.times do |n|
  title  = "第#{n+1}タイトル"
  content = "第#{n+1}コンテンツ"
  Article.create!(
    title: title,
    content: content,
    user_id: 2,
  )
  
end
