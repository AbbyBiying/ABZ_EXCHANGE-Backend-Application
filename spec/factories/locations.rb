FactoryBot.define do
  factory :location do
    number "1"
    street "Main Street"
    sequence(:city) { |n| "New York #{n}" }
    sequence(:state) { |n| "NY #{n}" }
  end
end
