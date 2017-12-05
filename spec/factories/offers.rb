FactoryBot.define do
  factory :offer do
    listing
    user
    sequence(:name) { |n| "Name No. #{n}" }
    sequence(:description) { |n| "Description No. #{n}" }
  end
end
