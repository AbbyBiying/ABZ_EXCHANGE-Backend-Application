Given(/^I login with "([^"]*)"$/) do |username|
  visit root_path
  fill_in "Username", with: username
  fill_in "Password", with: "password"
  click_button "Sign In"
  expect(page).to have_content username
 end

Given(/^I should be on the dashboard page$/) do
  expect(current_path).to eql dashboard_path
end

Given(/^"([^"]*)" has a listing with the name "([^"]*)" and the description "([^"]*)"$/) do |username, name, description|
  user = User.find_by(username: username)
  Listing.create!(user: user, name: name, description: description)
end

When(/^I go to the listings page$/) do
  visit listings_path
end

Then(/^I type comment body "([^"]*)"$/) do |text|
  fill_in "Body", with: text
end

Given /^I debug$/ do
  save_and_open_page
end

Given(/^"([^"]*)" has a comment "([^"]*)" to a listing with the name "([^"]*)" and the description "([^"]*)"$/) do |username, body, name, description|
  user = User.find_by(username: username)
  listing = Listing.create!(user: user, name: name, description: description)
  Comment.create!(commentable: listing, user: user, body: body)
end

When(/^I type new comment body "([^"]*)"$/) do |text|
  within(:css, '.edit-comment') do
    fill_in "Body", with: text
  end
end
