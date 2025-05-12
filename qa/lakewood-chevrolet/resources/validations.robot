*** Settings ***
Resource    ../../../global-resources/global-keywords.robot
Library    SeleniumLibrary
*** Keywords ***
    
Validate if the mandatory alerts are present on fields with asterisks
    [Arguments]    ${url}    ${reports}    ${page_name}
    Click on the submit button

    @{current_page_missing_alerts}=    Create List
    @{required_labels}=    Get WebElements    xpath=//label[.//span[contains(text(), '*')]]
    ${url}=    Get Location

    FOR    ${label}    IN    @{required_labels}
        ${placeholder}=    Get Label Text    ${label}
        ${field_id}=    Get Label ID   ${label}

        ${has_mandatory_error}=    Run Keyword And Return Status
        ...    Wait Until Keyword Succeeds
        ...    4x
        ...    0.1s
        ...    Element Should Be Visible
        ...    xpath=//*[@id="${field_id}"]/ancestor::nf-field//div[contains(@class, "nf-error")]          

        IF    not ${has_mandatory_error} and '${placeholder}' != 'My email here (*)'
            ${description}=    Set Variable    ${placeholder} has an asterisk but the mandatory text alert is not present
            ${entry}=    Catenate
            ...    ${page_name}: ${description}\n
            ...    ${url}\n

            Append To List    ${current_page_missing_alerts}    ${entry}
        END

    END
    Append To List    ${reports}    ${current_page_missing_alerts}

Validate if asterisks are present on fields with mandatory alerts
    [Arguments]    ${url}    ${reports}    ${page_name}
    Click on the submit button

    @{current_page_missing_asterisk}=    Create List
    @{labels_with_mandatory_alerts}=    Get WebElements
    ...    xpath=//div[contains(., '${FIELD VALUES["ALERT TEXT"]}')]/ancestor::div[contains(@class, 'nf-field-container')]//label

    ${url}=    Get Location

    FOR    ${label}    IN    @{labels_with_mandatory_alerts}
        ${placeholder}=    Get Label Text    ${label}
        ${field_id}=    Get Label ID   ${label}

        #========================= HACK ALERT ============================
        # THIS MUST NOT WORK ON RADIOBUTTONS OR CHECKBOXES
        Continue For Loop If    "${placeholder}" == "[missing placeholder]"
        #============================= end ===============================

        ${has_asterisk}=    Run Keyword And Return Status    Should End With    ${placeholder}    (*)  

        IF    not ${has_asterisk} and '${placeholder}' != 'My email here (*)'
            ${description}=    Set Variable    ${placeholder} has a mandatory text alert but the asterisk is not present.
            ${entry}=    Catenate
            ...    ${page_name}: ${description}\n
            ...    ${url}\n

            Append To List    ${current_page_missing_asterisk}    ${entry}
        END
    END
    Append To List    ${reports}    ${current_page_missing_asterisk}

Validate if the mandatory alerts are present on checkboxes with asterisks MELANIE
    Click on the submit button
    # IMPLEMENTATION PENDING
    Append To List    ${reports}    ${current_page_missing_alerts}

Validate if asterisks are present on checkboxes with mandatory alerts ROXANA
    Click on the submit button
    # IMPLEMENTATION PENDING
    Append To List    ${reports}    ${current_page_missing_asterisk}
