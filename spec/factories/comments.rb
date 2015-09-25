FactoryGirl.define do
  factory :comment do
    commentable { create(:listing) }
    user
    sequence(:body) { |n| "this is my comment #{n}" }
  end
end
