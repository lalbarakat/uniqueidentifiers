Feature: Manage Users
  In order to make a login
  As an user
  I want to create and manage users
  
  Scenario: Users List
    Given I have user nameded Eric B, Laith M
    When I go to the list of users
    Then I should see "Eric B"
    And I should see "Laith M"
  
  Scenario: Create Valid User
    Given I have no users
    And I am on the list of users
    When I follow "Add User"
    And I fill in "First Name" with "Glen"
    And I fill "Last Name" with "Vigus" 
    And I fill "User Name" with "Gvigus" 
    And I fill "Password" with "mypassword" 
    And I fill "Email" with "gvigus@tamu.edu"
    And I press "Create User"
    Then I should see "New user created."
    And I should see "Glen"
    And I should see "Vigus"
    And I should see "Gvigus"
    And I should see "gvigus@tamu.edu"
    And I should have 1 user

 Scenario: Update existing User
    Given I have at least 1 user
    And I am on the list of users
    When I follow "Edit"
    And I fill in "First Name" with "Glen2"
    And I fill "Last Name" with "Vigus2" 
    And I fill "User Name" with "Gvigus2" 
    And I fill "Password" with "mypassword2" 
    And I fill "Email" with "gvigus@tamu.edu"
    And I press "Update User"
    Then I should see "User was successfully updated."
    And I should see "Glen2"
    And I should see "Vigus2"
    And I should see "Gvigus2"
    And I should see "gvigus@tamu.edu"
    And I should have 1 user

 Scenario: Delete Valid User
    Given I have at least 1 users
    And I am on the list of users
    When I click on "remove" link within user1
    And confirm popup
    Then I shouldn't see the user1
