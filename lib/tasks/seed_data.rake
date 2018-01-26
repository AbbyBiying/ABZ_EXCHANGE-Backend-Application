task :seed_data => :environment do
  location = Location.create!(number: "1", street: "Main Street", city: "Boston", state: "MA", country: "USA")
  user = User.create!(username: "ABC", email: "abc@example.com", bio: "I am a painter.", password: "2445", location: location)
  Listing.create!(name: "pencil", description: "black", user: user)
  Group.create!(name: "book-club", description: "Members meet weekly.", user: user)
end
