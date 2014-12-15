Feature: Manage Students
  In order to make checkout
  As an user
  I want to create, update, delete, view and manage students
  
  Scenario: Students List
    Given I have student nameded Eric, Laith
    When I go to the list of students
    Then I should see "Eric"
    And I should see "Laith"

	Scenario: Create Valid Student
    Given I have no students
    And I am on the list of users
    When I follow "New Student"
		And I fill in "Uin" with "619001234"
    And I fill in "First Name" with "Glen"
    And I fill "Last Name" with "Vigus" 
    And I fill "Email" with "gvigus@tamu.edu"
		And I fill "Phonenumber" with "9791230000"
    And I press "Create User"
    Then I should see "Student was successfully created."
		And I should see "619001234"
    And I should see "Glen"
    And I should see "Vigus"
    And I should see "Gvigus"
    And I should see "gvigus@tamu.edu"
    And I should have 1 user

	Scenario: Update existing Student
    Given I have 1 student
    And I am on the list of students
    When I follow "Edit"
		And I fill in "Uin" with "619001230"
    And I fill in "First Name" with "Glen"
    And I fill "Last Name" with "Vigus" 
    And I fill "Email" with "gvigus@tamu.edu"
		And I fill "Phonenumber" with "9991230000"
    And I press "Update User"
    Then I should see "User was successfully updated."
		And I should see "619001230"
    And I should see "Glen2"
    And I should see "Vigus2"
    And I should see "Gvigus"
    And I should see "gvigus2@tamu.edu"
		And I fill "Phonenumber" with "9991230000"
    And I should have 1 user

	Scenario: Delete Valid Student
    Given I have at least 1 student
    And I am on the list of students
    When I click in remove link within student1
    And confirm popup
    Then I shouldn't see the student1

	Scenario: View Existing Student
    Given I am on the students list
    When I follow "show"
    Then I should see "Uin"
		And I should see "Firstname"
		And I should see "Lastname"
		And I should see "email"
		And I should see "phonenumber"


