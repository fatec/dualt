Feature: Managing Notes
  In order to manage the bilan
  As a student
  I want to see my note and my teacher note, and be able to change my note
  
  Scenario: Displaying a context
    Given I am logged in as a student
    When I am on the bilan page
    And I follow a competence
    Then I should see "ma note"
    
  Scenario: Changing my note
    Given I am logged in as a student
    And I am on the context page
    When I fill "ma note" with "3"
    And I press "Mettre à jour"
    Then I should see "Note mise à jour"
    