FactoryBot.define do
    factory :article do
      user
      title { 'sample' }
      content {'sample'}
    end
end
