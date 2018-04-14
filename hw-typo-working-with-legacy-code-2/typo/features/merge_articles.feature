Feature: Merge  Articles
Bloggers on one site, the authors may write more than one article 
on the same topic and say similar things. 

As an admin user I will be able to visit the article view and there should be a form 
on that article’s edit page that allows me to enter in the ID of another
article to merge the current article with. When this happens both articles’ content 
should be preserved, but merged together into one article.

Background:
    Given the blog is set up
    
Scenario: A non-admin cannot merge articles
    Given I am logged as user
    And the following articles exist:
    			| title              | published | 
			    | My trip to Tailand | true      |
    When I go to the view page for "My trip to Tailand" 
    Then I should not see "merge_with"

Scenario: Merging articles content
    Given I am logged into the admin panel
    And the following articles exist:
    			| title             | published | body  |
			    | My trip to Spain  | true      | body1 |
                | Visiting Madrid   | true      | body2 |
    And I am on the edit page for "My trip to Spain"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on "merged article" page
    And I should see "body1"
    And I should see "body2" 

Scenario: Merging articles preserves one of the original titles
    Given I am logged into the admin panel
    And the following articles exist:
    			| title             | published | body  |
			    | My trip to Spain  | true      | body1 |
                | Visiting Madrid   | true      | body2 |
    And I am on the edit page for "My trip to Spain"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on "merged article" page
    And I should see "My trip to Spain"

Scenario: Merging articles preserves comments from original articles 
    Given I am logged into the admin panel
    And the following articles exist:
    			| title             | published | body  |
			    | My trip to Spain  | true      | body1 |
                | Visiting Madrid   | true      | body2 |
    And article "My trip to Spain" has 2 comments
    And article "Visiting Madrid" has 1 comments
    And I am on the edit page for "My trip to Spain"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on "merged article" page
    And I should see "3 comments"