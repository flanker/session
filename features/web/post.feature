Feature: Create new post
  As a user
  I want to create new post

  Scenario: Create new post
    When I go to home page
    And I click 'New post'
    And I fill in the following:
      | Title   | My first post      |
      | Content | first post content |
    And I save the post
    Then I should redirect to post index page
    And there should have the following post in the home page:
      | Title   | My first post      |
      | Content | first post content |

  Scenario: Title and content
    When I go to home page
    And I click 'New post'
    And I save the post
    Then I should see the error message "Title can not be empty"
    And I should see the error message "Content can not be empty"


