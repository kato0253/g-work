FactoryBot.define do
  factory :Article do
    user
    title { 'detail1' }
    content { 'detail2' }
  end

  factory :second_task, class: Article do
    user
    title { 'detail1' }
    content { 'detail2' }
  end
end
