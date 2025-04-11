** Settings **
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./global-resources/keywords.robot
Resource    ./global-resources/variables.robot
Resource    ../../../resources/keywords.robot

* Test Cases **
Case01: Validate FIRST NAME placeholder asterisk
    Load the page
    Fill last name field
    Fill email field
    Fill phone field
    Fill postal code
    Fill message
    Click on the submit button
    Wait Until Element Is Visible   ${read_alert_text}  timeout=0.1s
    Visualize a mandatory warning
    Close Browser