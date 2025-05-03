*** Settings ***
Library    SeleniumLibrary
Library    Collections

** Keywords **
Open All Pages with Forms
    [Arguments]    ${file_path}    ${VALIDATION_KEYWORD}
    @{reports}=    Create List
    Load Spreadsheet    ${file_path}
    ${form_map}=    Get Form URL Map
    Open Browser    about:blank    chrome

    FOR    ${url}    IN    @{form_map.keys()}
        ${page_name}=    Get From Dictionary    ${form_map}    ${url}
        Go To    ${url}
        Log To Console    🔍 Checking: ${page_name} (${url})
        Run Keyword    ${VALIDATION_KEYWORD}    ${url}    ${reports}    ${page_name}
    END

    Log Errors on Console    ${reports}
    Close Browser

Log Errors on Console
    [Arguments]    ${reports}
    IF    "${reports}" != "[[]]"
        ${flat}=    Create List
        FOR    ${group}    IN    @{reports}
            FOR    ${line}    IN    @{group}
                Append To List    ${flat}    ${line}
            END
        END
        ${joined}=    Evaluate    '\\n'.join(${flat})
        Fail    ${joined}
    END

Find all available fields and fill them
    [Arguments]    ${url}
    FOR    ${FIELD_NAME}    IN    @{PLACEHOLDERS.keys()}
        ${locator}=    Set Variable    ${PLACEHOLDERS["${FIELD_NAME}"]}
        ${value}=      Set Variable    ${FIELD_VALUES["${FIELD_NAME}"]}
        ${is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}    #timeout=1s  

        Run Keyword If    ${is_present}   Forms Parser    ${locator}    ${value}
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

Get Field Label
    [Arguments]    ${input}    ${label}
    ${placeholder}=    Get Element Attribute    ${input}    placeholder
    IF    '${placeholder}' == 'None' or '${placeholder}' == ''
        ${placeholder}=    Get Text    ${label}
        IF    '${placeholder}' == 'None' or '${placeholder}' == ''
            ${placeholder}=    Get Selected List Label    ${input}            
        END
    END

    IF    '${placeholder}' == 'None' or '${placeholder}' == ''
        ${placeholder}=    Set Variable    [unsupported label]
    END
    RETURN    ${placeholder}
