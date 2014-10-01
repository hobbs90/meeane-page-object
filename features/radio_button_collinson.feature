Feature: Collinson Radio Buttons
  In order to interact with radio buttons on the Collinson websites
  Testers will need access and interrogation ability


  Background:
    Given I am on the static elements page

  Scenario: Selecting and clearing a collinson radio button
    When I select the "Individual" collinson radio button
#    Then the "Individual" collinson radio button should be selected
#    When I select the "Couple" collinson radio button
#    Then the "Couple" collinson radio button should be selected

  Scenario Outline: Locating collinson radio buttons on the Page
    When I search for the collinson radio button by "<search_by>"
    And I select the collinson radio button
    Then the "Individual" collinson radio button should be selected

  Scenarios:
    | search_by |
    | id        |
    | class     |
    | name      |
    | xpath     |
    | value     |
    | index     |
    | label     |

  @selenium_only
  Scenario Outline: Locating collinson radio buttons on the Page
    When I search for the collinson radio button by "<search_by>"
    And I select the collinson radio button
    Then the "Individual" collinson radio button should be selected

  Scenarios:
    | search_by |
    | css       |

  Scenario Outline: Locating collinson radio buttons using multiple parameters
    When I search for the collinson radio button by "<param1>" and "<param2>"
    And I select the collinson radio button
    Then the "Individual" collinson radio button should be selected

  Scenarios:
    | param1 | param2 |
    | class  | index  |
    | name   | index  |

  Scenario: Retrieve a collinson radio button
    When I retrieve a collinson radio button
    Then I should know it exists
    And I should know it is visible

  Scenario: Finding a collinson radio button dynamically
    When I select the collinson radio button while the script is executing
    Then I should see that the collinson radio button exists
    And the "Milk" collinson radio button should be selected
