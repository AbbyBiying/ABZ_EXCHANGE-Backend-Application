Feature: Follow_relationships
  As an existing user
  I want to follow and unfollw another user

  Background: User set up
    Given I am signed in as "Abby"
    And A user exists with the username "Joe"

  Scenario: follow and unfollow another user
    When I click on "Users"
    And I click on "Joe"
    And I click on "follow!"
    And I click on "Settings"
    Then I should see "Abby's following: Joe"
    When I click on "Joe"
    And I click on "unfollow!"
    Then I should see button "follow!"
