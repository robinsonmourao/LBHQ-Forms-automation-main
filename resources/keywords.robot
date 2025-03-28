** Keywords **
Load the page
    Open Browser                    ${BASE_URL}                                 chrome
Fill first name field
    Input Text                      ${input_first_name_by_placeholder}          ${EMPTY}
    # Sleep   2s
Fill last name field
    Input Text                      ${input_last_name_by_placeholder}           LBHQQA_LAST_NAME
Fill email field
    Input Text                      ${input_email_by_placeholder}               robinson@leadboxhq.com
Fill phone field
    Input Text                      ${input_phone_by_placeholder}               1111111111

Fill message or additional vehicle information
    ${has_required_message}=    Run Keyword And Return Status    Element Should Be Visible    ${input_message_by_placeholder}
    ${has_optional_message}=    Run Keyword And Return Status    Element Should Be Visible    ${input__non_message_by_placeholder}
    ${has_vehicle_info}=        Run Keyword And Return Status    Element Should Be Visible    ${input_additional_vehicle_information_by_placeholder}

    IF    ${has_required_message}
        Input Text    ${input_required_message_by_placeholder}                       AUTOMATIZED_TESTS_REQUIRED_MESSAGE
    ELSE IF ${has_optional_message}
        Input Text    ${input_optional_message_by_placeholder}                       AUTOMATIZED_TESTS_OPTIONAL_MESSAGE
    ELSE IF ${has_vehicle_info}
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

Click on the submit button
    Click Button                    ${click_button_by_id}

Visualize a mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.

Open and Check All Pages with Forms
    [Arguments]    ${file_path}
    Load Spreadsheet    ${file_path}
    ${urls}=    Get Urls With Form
    Open Browser    about:blank    chrome

    FOR    ${url}    IN    @{urls}
        Go To    ${url}   

        # Page Should Contain Element    //form
        Fill last name field
        Fill email field
        Fill phone field
        Fill message or additional vehicle information
        Click on the submit button
        Wait Until Element Is Visible   ${read_alert_text}  timeout=0.1s
        Then Visualize a mandatory warning

    END
    
