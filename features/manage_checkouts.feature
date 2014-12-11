Feature: Manage Items
  In order to list items
  and create, update, delete, make item
  As an user
  I want to create and manage Items
  
  Scenario: Items List
    Given I have item nameded Camera1, Camera2
    When I go to the list of items
    Then I should see "Camera1"
    And I should see "Camera2"
  
  Scenario: Create Valid Item
    Given I have no items
    And I am on the list of items
    When I click "Add item"
    And I fill in "Name" with "Camera1"
    And I slecet "Category" as "Cameras" 
    And I press "Create Item"
    Then I should see "Item was successfully created."
    And I should see "camera1"
    And I should have 1 item

 Scenario: Update existing Item
    Given I have at least 1 item
    And I am on the list of items
    When I follow "Edit"
    And I fill in "Name" with "Microphone"
    And I select "Category" as "Audio" 
    And I press "OK"
    Then I should see the list if items
    And I should see "Microphone"
    And I should see "Audio"
    And I should have 1 item

 Scenario: Delete Valid Item
    Given I have at least 1 items
    And I am on the list of items
    When I click on "remove" link within item1
    And confirm popup
    Then I shouldn't see the item1

  Scenario: Pprint QR for item
    Given I have at least 1 items
    And I am on the list of items
    When I click on "show" link within item1
    And I click print
    Then I shouldn pritn the QR for item1
