FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Name No. #{n}"}
    sequence(:description) { |n| "Description No. #{n}"}
    user
  end
end
