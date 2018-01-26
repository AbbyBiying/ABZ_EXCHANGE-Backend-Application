Given(/^A user exists with the username "([^"]*)"$/) do |username|
  location = Location.last || Location.create!(city: "New York", state: "NY")
  User.create!(username: username, password: "password", location: location, email: "#{username}@#{username}.com")
end
