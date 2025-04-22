** Settings **
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./global-resources/keywords.robot
Resource    ./global-resources/variables.robot
Resource    ./global-resources/matrix.robot
Resource    ./production/toronto-lincoln/resources/keywords.robot
Resource    ./production/toronto-lincoln/resources/variables.robot

** Test Cases **
Case01: Validate FIRST NAME mandatory alert text
    Load the page
    
    Fill last name
    Fill email
    Fill phone
    Fill postal code by matrix
    Fill lincoln retailer
    Fill message by matrix
    Click on the submit button
    Wait Until Element Is Visible   ${read_alert_text}  timeout=0.1s
    Visualize a mandatory warning
    Close Browser

Case02: Validate LAST NAME mandatory alert text