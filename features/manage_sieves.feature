Feature: Manage Sieves
  In order to make a sieve
  As an mine
  I want to create and manage mines

Scenario: Sieves List
  Given I have sieves titled Golin, Gimli
  When I go to the list of sieves
  Then I should see "Golin"
  And I should see "Gimli"

Scenario: Create Valid Sieve
  Given I have no sieve
  And I am on the list of sieves
  When I follow "New Sieve"
  And I fill in "Name" with "Durin"
  And I press "Create"
  Then I should see "New sieve created."
  And I should see "Durin"
  And I should have 1 sieve

