Feature: Create Listing
  As an existing user
  I want to add a listing on my dashboard page

  Background: User set up
    Given I am signed in as "Abby"

  Scenario: dashboard page
    Given I am at dashboard page
    When I click on "Listings"
    And I click on "Make New Listing"
    Then I am at listing new page
    And I type name "A pen"
    And I type description "black ink"
    And I click on "Submit"
    And I should see "posted by Abby"
