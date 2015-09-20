FactoryGirl.define do
  factory :listing do
    sequence(:name) { |n| "Name No. #{n}"}
    sequence(:description) { |n| "Description No. #{n}"}
    user
  end
end
