** Settings **
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./global-resources/keywords.robot
Resource    ./global-resources/variables.robot

** Test Cases **
Case01: Validate FIRST NAME requirement
    Given Load the page
    When Fill first name field
        And Fill last name field
        And Fill email field
        And Fill phone field
        # And Choose a preferred transportation
        # And Choose a preferred comunication
        # And Choose a lincoln retailer
        # And Fill request appointment time field
        And Fill message or additional vehicle information
        And Click on the submit button
            Wait Until Element Is Visible   ${read_alert_text}  timeout=0.1s
    Then Visualize a mandatory warning
    Close Browser