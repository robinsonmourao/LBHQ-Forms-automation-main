*** Settings ***
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./global-resources/keywords.robot
Resource    ./global-resources/variables.robot
Resource    ./qa/toronto-lincoln/resources/keywords.robot
Resource    ./qa/toronto-lincoln/resources/variables.robot

*** Test Cases ***
Case01: Validate FIRST NAME requirement
    Open and Check All Pages with Forms    ${SPREADSHEET_PATH}