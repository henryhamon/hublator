
Scenario: Create Valid User
  Given I have no users
  And I am on the login
  When I fill in "Google Username" with "merch.blender"
  And I fill in "Google Password" with "ozzymandias"
  And I press "Login"
  
Scenario: Create InValid User
  Given I have no users
  And I am on the login
  When I fill in "Google Username" with "merclender@gmail.com"
  And I fill in "Google Password" with "ozzymdias"
  And I press "Login"
  Then I should see "Username or password are incorrect."
  
