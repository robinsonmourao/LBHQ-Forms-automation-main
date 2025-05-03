*** Keywords ***
    
Validate if the mandatory alerts are present
    [Arguments]    ${url}    ${reports}    ${page_name}
    Click on the submit button

    @{current_page_missing_alerts}=    Create List
    @{required_labels}=    Get WebElements    xpath=//label[.//span[contains(text(), '*')]]
    ${url}=    Get Location

    FOR    ${label}    IN    @{required_labels}
        ${input_id}=         Get Element Attribute    ${label}    for
        ${input}=            Get WebElement    xpath=//*[@id="${input_id}"]
        ${placeholder}=    Get Field Label    ${input}    ${label}

        ${mandatory_error_visible}=    Run Keyword And Return Status
        ...    Wait Until Keyword Succeeds
        ...    5x
        ...    0.1s
        ...    Element Should Be Visible
        ...    xpath=//*[@id="${input_id}"]/ancestor::nf-field//div[contains(@class, "nf-error")]

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
    Should Be Equal As Strings      ${alert}        This is a required field.

# Get Field Label
#     [Arguments]    ${input}    ${label}

#     ${placeholder}=    Set Variable    "None"

#     @{strategies}=    Create List
#     ...    Get Element Attribute    ${input}    placeholder
#     ...    Get Element Attribute    ${input}    tagName
#     ...    Get Text    ${label}
#     ...    Get Selected List Label    ${input}
    
#     FOR    ${strategy}    IN    @{strategies}
#         ${placeholder}=    Run Keyword    ${strategy}    ${input}    ${label}
#         IF    '${placeholder}' != 'None' and '${placeholder}' != ''
#             Exit For Loop
#         END
#     END

#     IF    '${placeholder}' == 'None' or '${placeholder}' == ''
#         ${placeholder}=    Set Variable    [unsupported label]
#     END

#     [Return]    ${placeholder}