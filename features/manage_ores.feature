Feature: Manage ores
  In order to make a ore
  As an mine
  I want to create and manage ores

Scenario: Create Valid Ore
  Given I have no ore
  And I am on the list of ores
  When I follow "New ore"
  And I fill in "Url" with "http://www.valinor.com.br/option,com_rss/feed,RSS2.0/no_html,1/"
  And I press "Create"
  Then I should see "New ore created."
  And I should have 1 ore

