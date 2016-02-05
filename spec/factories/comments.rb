FactoryGirl.define do
  factory :comment do
    association :post, factory: :post
    comment Faker::Lorem.sentence(3)
  end
end
