Feature: Edit Comment
  As an existing user
  I want to edit my comment on the listing's page

  Background: User set up
    Given I am signed in as "Abby"
    And "Abby" has a comment "This is great!" to a listing with the name "pizza" and the description "delicious"
    And I go to the listings page
    And I click on "pizza"

  Scenario: Edit Comment
    When I type new comment body "This is really great!"
    And I click on "Update Comment"
    Then I should see "This is really great!"
