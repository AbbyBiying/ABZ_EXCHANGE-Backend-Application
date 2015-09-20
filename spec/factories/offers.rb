FactoryGirl.define do
  factory :offer do
    sequence(:name) { |n| "Name No. #{n}" }
    sequence(:description) { |n| "Description No. #{n}" }
    user
  end
end
