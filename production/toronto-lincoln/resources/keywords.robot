*** Settings ***
Library    SeleniumLibrary
Resource   ./production/toronto-lincoln/scenario01-Validate mandatory alert texts/matrix.robot

** keywords **
Fill first name
    Input Text    ${PLACEHOLDERS["FIRST_NAME"]}    ${FIELD_VALUES["FIRST_NAME"]}
Fill last name
    Input Text    ${PLACEHOLDERS["LAST NAME"]}    ${FIELD_VALUES["LAST NAME"]}
Fill email
    Input Text    ${PLACEHOLDERS["EMAIL"]}    ${FIELD_VALUES["EMAIL"]}
Fill phone
    Input Text    ${PLACEHOLDERS["PHONE"]}    ${FIELD_VALUES["PHONE"]}
Fill postal code by matrix
    Input Text    ${PLACEHOLDERS["POSTAL CODE"]}    ${FIELD_VALUES["POSTAL CODE"]}
Fill message by matrix
    Input Text    ${PLACEHOLDERS["MESSAGE"]}    ${FIELD_VALUES["MESSAGE"]}
Fill lincoln retailer
    Select From List By Value    ${PLACEHOLDERS["LINCOLN RETAILER"]}    ${FIELD_VALUES["LINCOLN RETAILER"]}