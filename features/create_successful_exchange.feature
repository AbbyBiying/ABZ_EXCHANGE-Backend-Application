Feature: Create Successful Exchange
  As an existing user
  I want to make a successful exchange

  Background: User set up
    Given I am signed in as "Abby"
    And "Abby" has a listing with name "pizza" and description "very hot and smokey"
    And A user exists with the username "Joe"
    And "Joe" makes an offer with the name "noodle" and the description "very delicious" for "pizza"

  Scenario: Listings List
    When I go to the listings page
    Then I should see "pizza"
    When I click on "pizza"
    And I click on "ACCEPT"
    And I click on "COMPLETE"
