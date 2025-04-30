*** Settings ***
Library    SeleniumLibrary

** Keywords **
Open All Pages with Forms
    [Arguments]    ${file_path}    ${VALIDATION_KEYWORD}
    Load Spreadsheet    ${file_path}
    ${urls}=    Get Urls With Form
    Open Browser    about:blank    chrome

    FOR    ${url}    IN    @{urls}
        Run Keyword If    '${url}' == ''    Continue For Loop
        Go To    ${url}
        Log To Console    🔍 Checking: ${url}
        Run Keyword    ${VALIDATION_KEYWORD}    ${url}
    END
    Close Browser

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

Visualize a mandatory warning
    ${alert}=                       Get Text        ${read_alert_text}  
    Should Be Equal As Strings      ${alert}        This is a required field.

Validate if the last name field is mandatory
    Element Should Contain    ${first_name_alert_by_xpath}    This is a required field.
