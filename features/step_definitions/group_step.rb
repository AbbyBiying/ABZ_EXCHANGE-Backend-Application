Given(/^"([^"]*)" create a group with name "([^"]*)" and with description "([^"]*)"$/) do |username, name, description|
  user = User.find_by(username: username)
  group = Group.create!(user: user, name: name, description: description)
end
