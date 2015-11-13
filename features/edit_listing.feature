Feature: Edit Listing
  As an existing user
  I want to edit my listing

  Background: User set up
    Given I am signed in as "Abby"
    And "Abby" has a listing with the name "A book" and the description "art history"
    And I go to the listings page
    And I click on "A book"

  Scenario: Edit Listing
    When I click on "Edit"
    When I type new name "This is a book!"
    And I click on "Update Listing"
    Then I should see "This is a book!"
