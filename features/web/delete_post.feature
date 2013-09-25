Feature: Delete post
  As a user
  I want to delete post

  Scenario: Delete post
    Given I have post
    When I go to the post detail page
    And I click 'Delete'
    Then I should be redirected to home page
    And I should not see that post
