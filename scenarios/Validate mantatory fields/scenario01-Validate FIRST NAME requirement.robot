*** Settings ***
Library     SeleniumLibrary
Library     ./utils/ExcelFormScanner.py
Resource    ./resources/keywords.robot
Resource    ./resources/variables.robot

*** Test Cases ***
Case01: Validate FIRST NAME requirement
    Open and Check All Pages with Forms    ${SPREADSHEET_PATH}