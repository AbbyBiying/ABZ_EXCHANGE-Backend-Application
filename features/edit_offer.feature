Feature: Edit Offer
  As an existing user
  I want to edit my offer

  Background: User set up
    Given I am signed in as "Abby"
    And A user exists with the username "Joe"
    And "Joe" has a listing with the name "noodle" and the description "very delicious"
    And "Abby" makes an offer with the name "A pen" and the description "black ink" for "noodle"
    And I go to the listings page
    And I click on "noodle"
    And I click on "A pen"

  Scenario: Edit Offer
    When I click on "Edit"
    And I type new name "A blue pen"
    And I type new description "made in China"
    And I click on "Update Offer"
    Then I should see "made in China"
