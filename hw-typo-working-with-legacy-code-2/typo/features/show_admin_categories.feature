Feature: Show admin categores
  As a blog administrator
  In order to organize my articles by related content
  I want to be able to create article categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully show
    Given I am on the admin content page
    When I follow "Categories"
    Then I should see "Categories"
