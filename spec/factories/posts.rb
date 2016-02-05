FactoryGirl.define do
  factory :post do
    title Faker::Lorem.word
    description Faker::Lorem.sentence(3)
  end

  factory :post_with_comments, parent: :post do
    after(:create) do |post|
      post.comments << create(:comment, post: post)
    end
  end
end
