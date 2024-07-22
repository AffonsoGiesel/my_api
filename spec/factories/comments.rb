FactoryBot.define do
  factory :comment do
    comment { "This is a comment." }
    association :post
  end
end