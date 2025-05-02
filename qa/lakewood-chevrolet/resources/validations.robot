*** Keywords ***
    
Validate if the mandatory alerts are present
    [Arguments]    ${url}    ${reports}
    Click on the submit button

    @{current_page_missing_alerts}=    Create List
    @{required_labels}=    Get WebElements    xpath=//label[.//span[contains(text(), '*')]]
    ${url}=    Get Location

    FOR    ${label}    IN    @{required_labels}
        ${input_id}=         Get Element Attribute    ${label}    for
        ${input}=            Get WebElement    xpath=//*[@id="${input_id}"]
        ${placeholder}=    Get Field Label    ${input}    ${label}

        ${mandatory_error_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//*[@id="${input_id}"]/ancestor::nf-field//div[contains(@class, "nf-error")]
        
        IF    not ${mandatory_error_visible}  
            Append To List    ${current_page_missing_alerts}    ${url} > ${placeholder}
        END

    END
    Append To List    ${reports}    ${current_page_missing_alerts}

Validate the mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.
