** Settings **
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./global-resources/global-keywords.robot
Resource    ./global-resources/global-variables.robot
Resource    ./global-resources/matrix.robot
Resource    ./qa/lakewood-chevrolet/resources/variables.robot
Resource    ./qa/lakewood-chevrolet/resources/keywords.robot

** Test Cases **
Case01: Validate mandatory alert text
    Open All Pages with Forms    ${SPREADSHEET_PATH}    Find all available fields and fill them   
    Close Browser
