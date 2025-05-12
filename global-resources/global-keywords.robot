*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ./utils/RemovePartsFromStrings.py
Resource   ./global-resources/helpers.robot

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

Click on the submit button
    ${is_present}=    Run Keyword And Return Status
    ...    Wait Until Keyword Succeeds    5x    1s    Element Should Be Visible    ${PLACEHOLDERS["SUBMIT BUTTON"]}

    IF    ${is_present}
        ${button_text}=    Get Element Attribute    ${PLACEHOLDERS["SUBMIT BUTTON"]}    value
        Run Keyword If    '${button_text}' == 'Subscribe'    Log To Console    ⚠️ Skipping 'Subscribe' button
        IF    '${button_text}' != 'Subscribe'
            Click Button    ${PLACEHOLDERS["SUBMIT BUTTON"]}
        END
    ELSE
        Log To Console     ⚠️ Submit button not found — skipping click
    END
    