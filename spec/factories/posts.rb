FactoryBot.define do
  factory :post do
    title { "Post title" }
    text { "Post content" }
    association :user
  end
end