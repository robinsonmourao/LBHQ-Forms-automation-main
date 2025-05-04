*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
    
Validate if the mandatory alerts are present
    [Arguments]    ${url}    ${reports}    ${page_name}
    Click on the submit button

    @{current_page_missing_alerts}=    Create List
    @{required_labels}=    Get WebElements    xpath=//label[.//span[contains(text(), '*')]]
    ${url}=    Get Location

    FOR    ${label}    IN    @{required_labels}
        ${placeholder}=    Get Label Text    ${label}
        ${field_id}=    Get Field ID   ${label}

        ${mandatory_error_visible}=    Run Keyword And Return Status
        ...    Wait Until Keyword Succeeds
        ...    4x
        ...    0.1s
        ...    Element Should Be Visible
        ...    xpath=//*[@id="${field_id}"]/ancestor::nf-field//div[contains(@class, "nf-error")]

        IF    not ${mandatory_error_visible} and '${placeholder}' != 'My email here (*)'
            ${description}=    Set Variable    ${placeholder} has an asterisk but the mandatory text alert is not present
            ${entry}=    Catenate
            ...    ${page_name}: ${description}\n
            ...    ${url}\n

            Append To List    ${current_page_missing_alerts}    ${entry}
        END

    END
    Append To List    ${reports}    ${current_page_missing_alerts}


Validate the mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        ${FIELD_VALUES[ALERT TEXT]}

# Get Field Label
#     [Arguments]    ${xpath}    ${label}

#     ${placeholder}=    Set Variable    "None"

#     @{strategies}=    Create List
#     ...    Get Element Attribute    ${xpath}    placeholder
#     ...    Get Element Attribute    ${xpath}    tagName
#     ...    Get Text    ${label}
#     ...    Get Selected List Label    ${xpath}
    
#     FOR    ${strategy}    IN    @{strategies}
#         ${placeholder}=    Run Keyword    ${strategy}    ${xpath}    ${label}
#         IF    '${placeholder}' != 'None' and '${placeholder}' != ''
#             Exit For Loop
#         END
#     END

#     IF    '${placeholder}' == 'None' or '${placeholder}' == ''
#         ${placeholder}=    Set Variable    [unsupported field]
#     END

#     [Return]    ${placeholder}