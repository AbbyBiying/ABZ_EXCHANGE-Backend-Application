Given(/^I am signed in as "([^"]*)"$/) do |username|
  steps %Q{
    Given A user exists with the username "#{username}"
    And I login with "#{username}"
    Then I should be on the dashboard page
  }
end
