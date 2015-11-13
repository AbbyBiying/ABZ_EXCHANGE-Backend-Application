When(/^I click on "([^"]*)"$/) do |text|
  click_on text
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Given(/^I am at dashboard page$/) do
  expect(current_path).to eql dashboard_path
end

Then(/^I should see button "([^"]*)"$/) do |text|
  find_button text
end

When(/^I type name "([^"]*)"$/) do |text|
  fill_in "Name", with: text
end

When(/^I type description "([^"]*)"$/) do |text|
  fill_in "Description", with: text
end

When(/^I type new name "([^"]*)"$/) do |text|
  fill_in "Name", with: text
end

When(/^I type new description "([^"]*)"$/) do |text|
  fill_in "Description", with: text
end
