Then(/^I am at listing new page$/) do
  expect(current_path).to eql new_listing_path
end
