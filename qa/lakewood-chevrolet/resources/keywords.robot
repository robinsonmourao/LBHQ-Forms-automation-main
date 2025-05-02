*** Settings ***
Library    SeleniumLibrary
Library    Collections

** Keywords **
Open All Pages with Forms
    [Arguments]    ${file_path}    ${VALIDATION_KEYWORD}
    @{reports}=    Create List
    Load Spreadsheet    ${file_path}
    ${urls}=    Get Urls With Form
    Open Browser    about:blank    chrome

    FOR    ${url}    IN    @{urls}
        Run Keyword If    '${url}' == ''    Continue For Loop
        Go To    ${url}
        Log To Console    🔍 Checking: ${url}
        Run Keyword    ${VALIDATION_KEYWORD}    ${url}    ${reports}
    END

    Log Errors on Console    ${reports}
    Close Browser

Log Errors on Console
    [Arguments]    ${reports}
    IF    ${reports} != []
        Log Many    ${reports}
        Fail    ${reports}
    END

Find all available fields and fill them
    [Arguments]    ${url}
    FOR    ${FIELD_NAME}    IN    @{PLACEHOLDERS.keys()}
        ${locator}=    Set Variable    ${PLACEHOLDERS["${FIELD_NAME}"]}
        ${value}=      Set Variable    ${FIELD_VALUES["${FIELD_NAME}"]}
        ${is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}    #timeout=1s  

        Run Keyword If    ${is_present}   Forms Parser    ${locator}    ${value}
        
        # DEBUGGING PURPOSE
        Run Keyword If    ${is_present}   Log To Console    Current page: ${url} > Element detected: ${FIELD_NAME} 
    END

Forms Parser
    [Arguments]    ${locator}    ${value}
    ${webelement}=    Get WebElement    ${locator}    
    ${tag}=           Get Element Attribute    ${locator}    tagName 

    IF    '${tag}' == 'INPUT'
        ${type}=    Get Element Attribute    ${locator}    type
        IF    '${type}' != 'submit'
            Input Text    ${locator}    ${value}
        ELSE
            Click Button    ${locator}
        END
    ELSE IF    '${tag}' == 'TEXTAREA'
        Input Text    ${locator}    ${value}
    ELSE IF    '${tag}' == 'SELECT'
        Select From List By Value    ${locator}    ${value}
    ELSE
        Log To Console    ⚠️ Unknown tag: ${tag}
    END


#==================================== VALIDATIONS =====================================


Visualize a mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.
    
Validate if the mandatory alerts are present
    [Arguments]    ${url}    ${reports}
    Click on the submit button

    @{current_page_missing_alerts}=    Create List
    @{required_labels}=    Get WebElements    xpath=//label[contains(text(), '*')]
    ${url}=    Get Location

    FOR    ${label}    IN    @{required_labels}
        ${input_id}=         Get Element Attribute    ${label}    for
        ${input}=            Get WebElement    xpath=//*[@id="${input_id}"]
        ${placeholder}=      Get Text    ${input}

        ${error_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//*[@id="${input_id}"]/ancestor::nf-field//div[contains(@class, "nf-error")]
        
        IF    not ${error_visible}
            Append To List    ${current_page_missing_alerts}    ${url} > ${input_id}

            ${current_error}=    Set Variable    Form validation failed — missing required alerts:\n${current_page_missing_alerts}
            Append To List    ${reports}    ❌ ${current_error}
        END
    END
