FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "abby#{n}" }
    sequence(:email) { |n| "abbyzhangnyc#{n}@gmail.com" }
    sequence(:bio) { |n| "I am an artist#{n}." }
    sequence(:password_digest) { |n| "iugdfghukijlkhjg#{n}" }
    location
  end
end
