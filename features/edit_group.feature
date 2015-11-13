Feature: Edit Group
  As an existing user
  I want to edit my listing

  Background: User set up
    Given I am signed in as "Abby"
    And "Abby" create a group with name "Bookclub" and with description "meet weekly"
    And I click on "Groups"
    And I click on "Bookclub"

  Scenario: Edit Group
    When I click on "Edit"
    And I type new name "Fullstack Programmer meetup"
    And I click on "Update Group"
    Then I should see "Fullstack Programmer meetup"
