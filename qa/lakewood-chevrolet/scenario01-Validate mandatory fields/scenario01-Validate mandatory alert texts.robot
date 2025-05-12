** Settings **
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py

Resource    ./global-resources/global-keywords.robot
Resource    ./global-resources/matrix.robot

Resource    ./qa/lakewood-chevrolet/resources/variables.robot
Resource    ./qa/lakewood-chevrolet/resources/validations.robot

** Test Cases **
Case01: Validate mandatory alert text
    Open All Pages with Forms    ${SPREADSHEET_PATH}    Validate if the mandatory alerts are present on fields with asterisks

Case02: Validate placeholder asterisk
    Open All Pages with Forms    ${SPREADSHEET_PATH}    Validate if asterisks are present on fields with mandatory alerts

Case03: Validate if the mandatory alerts are present on checkboxes with asterisks MELANIE
    # IMPLEMENTATION PENDING

Case04: Validate if asterisks are present on checkboxes with mandatory alerts ROXANA
    # IMPLEMENTATION PENDING