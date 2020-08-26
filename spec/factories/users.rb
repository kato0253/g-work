FactoryBot.define do
  factory :user do
    id { 10 }
    name { 'sample' }
    email { 'sample10@example.com' }
    password { '00000000' }
    admin { false }
  end
  factory :admin_user, class: User do
    id { 11 }
    name { 'admin' }
    email { 'admin11@example.com' }
    password { '00000000' }
    admin { true }
  end
end
