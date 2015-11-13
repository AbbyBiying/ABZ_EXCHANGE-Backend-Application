Feature: Create Group
  As an existing user
  I want to create a group

  Background: User set up
    Given I am signed in as "Abby"

  Scenario: Create a group
    Given I am at dashboard page
    When I click on "Groups"
    Then I should see "Make New Group"
    When I click on "Make New Group"
    Then I should see "New Group!"
    And I type name "Book Club"
    And I type description "meet weekly"
    And I click on "Create Group"
    Then I should see "created by Abby"
