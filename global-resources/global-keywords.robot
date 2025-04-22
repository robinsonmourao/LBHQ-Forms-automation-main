*** Settings ***
Library    SeleniumLibrary

** Keywords **
Load the page
    Open Browser                    ${BASE_URL}                                 chrome

Fill first name field
    Input Text                      ${input_first_name_by_placeholder}          ${EMPTY}
Fill last name field
    Input Text                      ${input_last_name_by_placeholder}           LBHQQA_LAST_NAME
Fill email field
    Input Text                      ${input_email_by_placeholder}               robinson@leadboxhq.com
Fill phone field
    Input Text                      ${input_phone_by_placeholder}               1111111111
Fill postal code
    Input Text                      ${postal_code_input_by_placeholder}         M4M 2A5
Fill message
    Input Text                      ${input_required_message_by_placeholder}    AUTOMATED_TESTS_MESSAGE

Click on the submit button
    Click Button                    ${click_button_by_id}
    Sleep    1s

Visualize a mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.

Validate if the last name field is mandatory
    Element Should Contain    ${first_name_alert_by_xpath}    This is a required field.
