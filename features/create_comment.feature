Feature: Create Comment
  As an existing user
  In order to comment on a listing
  I want to add a comment on the listing's page

  Background: User set up
    Given I am signed in as "Abby"

  Scenario: Listings List
    Given "Abby" has a listing with the name "pizza" and the description "delicious"
    When I go to the listings page
    Then I should see "pizza"
    And I should see "delicious"
    When I click on "pizza"
    Then I type comment body "This is great!"
    And I click on "Create Comment"
    Then I should see "This is great!"
    And I should see "posted by Abby"
