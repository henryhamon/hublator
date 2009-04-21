Feature: Manage Mines
  In order to make a RSS Mining System
  As an dwarf
  I want to create and manage mines

Scenario: Mines List
  Given I have mines titled Ithil, Tirith
  When I go to the list of mines
  Then I should see "Ithil"
  And I should see "Tirith"

Scenario: Create Valid Mine
  Given I have no mines
  And I am on the list of mines
  When I follow "New Mine"
  And I fill in "Name" with "Moria"
  And I fill in "Description" with "The Mines of Moria!"
  And I press "Create"
  Then I should see "New mine created."
  And I should see "Moria"
  And I should see "The Mines of Moria!"
  And I should have 1 mine

