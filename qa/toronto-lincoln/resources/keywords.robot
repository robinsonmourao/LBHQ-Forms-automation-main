*** Settings ***
Library    SeleniumLibrary

** Keywords **
Fill message or additional vehicle information
    ${has_required_message}=    Run Keyword And Return Status    Element Should Be Visible    ${input_required_message_by_placeholder}
    ${has_optional_message}=    Run Keyword And Return Status    Element Should Be Visible    ${input_optional_message_by_placeholder}
    ${has_vehicle_info}=        Run Keyword And Return Status    Element Should Be Visible    ${input_additional_vehicle_information_by_placeholder}
    Log To Console    ${has_required_message} ${has_optional_message} ${has_vehicle_info}
    IF    ${has_required_message}
        Input Text    ${input_required_message_by_placeholder}                  AUTOMATIZED_TESTS_REQUIRED_MESSAGE
    ELSE IF    ${has_optional_message}
        Input Text    ${input_optional_message_by_placeholder}                  AUTOMATIZED_TESTS_OPTIONAL_MESSAGE
    ELSE IF    ${has_vehicle_info}
        Input Text    ${input_additional_vehicle_information_by_placeholder}    2021 Tesla 3 #abc-0123456789
    END

Fill request appointment time field
    Input Text                      ${input_request_appointment_time_by_id}     12:00pm

Choose a preferred transportation
    Select From List By Value       ${select_preferred_transportation_by_id}   pickup-and-delivery
Choose a preferred comunication
    Select From List By Value       ${select_preferred_communication_by_id}    phone
Choose a lincoln retailer
    Select From List By Value       ${select_lincoln_retailer_by_id}           Downtown Lincoln

Visualize a mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.

Validate if the last name field is mandatory
    Element Should Contain    ${first_name_alert_by_xpath}    This is a required field.
    
Open and Check All Pages with Forms
    [Arguments]    ${file_path}
    Load Spreadsheet    ${file_path}
    ${urls}=    Get Urls With Form
    Open Browser    about:blank    chrome

    FOR    ${url}    IN    @{urls}
        Go To    ${url}   
        Fill last name field
        Fill email field
        Fill phone field
        Fill message or additional vehicle information
        Click on the submit button
        Wait Until Element Is Visible   ${read_alert_text}  timeout=0.1s
        Then Visualize a mandatory warning
    END    
