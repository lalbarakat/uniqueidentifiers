Feature: Manage Checkouts
  In order to list checkouts
  and create, update, delete checkout
  As an user
  I want to create and manage checkouts
  
  Scenario: Checkouts List
    Given I have checkout for item1, item2
    When I go to the list of checkouts
    Then I should see "item1"
    And I should see "item2"

	Scenario: Create Valid Checkout
    Given I have no checkouts
    And I am on the dashbord
    When I follow "Check out"
    And I fill in "First Name" with "Glen"
    And I fill "Last Name" with "Vigus" 
    And I fill "User Name" with "123001234" 
    And I fill "Email" with "gvigus@tamu.edu"
		And I fill "Phone Number" with "9795951234"
    And I press "Continue"
    Then I should see "Scan Items"
    And I should scan "Item1"
		And I press "Continue"
		Then I should see "review checkout"
		And I press "Finish"
    And I should have 1 checkout

	Scenario: View Existing Checkout
    Given I am on the checkouts list
    When I follow "show"
    Then I should see "view checkout"
		And I should see "student"
		And I should see "status"
		And I should see "items"

	Scenario: Update existing Checkout
    Given I have at least 1 checkout
    And I am on the list of checkouts
    When I follow "Edit Checkout"
		And I fill in "First Name" with "Glen"
    And I fill "Last Name" with "Vigus" 
    And I fill "User Name" with "123001234" 
    And I fill "Email" with "gvigus@tamu.edu"
		And I fill "Phone Number" with "9795951234"
    And I press "Continue"
    Then I should see "Scan Items"
    And I should scan "Item1"
		And I press "Continue"
		Then I should see "review checkout"
		And I press "Finish"
    And I should have 1 checkout

	Scenario: Delete Valid Checkout
    Given I have at least 1 checkout
    And I am on the list of checkouts
    When I click on "delete" link within checkout1
    And confirm popup
    Then I shouldn't see the user1























