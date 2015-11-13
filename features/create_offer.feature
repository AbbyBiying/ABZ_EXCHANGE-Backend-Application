Feature: Create Offer
  As an existing user
  I want to create an offer on the listing's page

  Background: User set up
    Given I am signed in as "Abby"
    And A user exists with the username "Joe"
    And "Joe" has a listing with the name "noodle" and the description "very delicious"

  Scenario: Listings List
    When I go to the listings page
    Then I should see "noodle"
    When I click on "very delicious"
    Then I should see "Make an offer"
    When I click on "Create Offer"
    And I type name "A pen"
    And I type description "blue ink"
    And I click on "Create Offer"
    Then I should see "blue ink"
