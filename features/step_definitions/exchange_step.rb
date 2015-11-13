Given(/^"([^"]*)" has a listing with name "([^"]*)" and description "([^"]*)"$/) do |username, name, description|
  user = User.find_by(username: username)
  listing = Listing.create!(user: user, name: name, description: description)
end

Given(/^"([^"]*)" makes an offer with the name "([^"]*)" and the description "([^"]*)" for "([^"]*)"$/) do |username, offer_name, offer_description, listing_name|
  user = User.find_by(username: username)
  listing = Listing.find_by(name: listing_name)
  offer = Offer.create!(user: user, listing: listing, name: offer_name, description: offer_description)
end
