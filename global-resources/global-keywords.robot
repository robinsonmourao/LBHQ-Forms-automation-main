*** Settings ***
Library    SeleniumLibrary

** Keywords **

Click on the submit button
    Wait Until Keyword Succeeds    5x    1s    Element Should Be Visible    ${PLACEHOLDERS["SUBMIT BUTTON"]}
    ${is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${PLACEHOLDERS["SUBMIT BUTTON"]}

    IF    ${is_present}
        ${button_text}=    Get Element Attribute    ${PLACEHOLDERS["SUBMIT BUTTON"]}    value
        Run Keyword If    '${button_text}' == 'Subscribe'    Log To Console    ⚠️ Skipping 'Subscribe' button
        IF    '${button_text}' != 'Subscribe'
            Click Button    ${PLACEHOLDERS["SUBMIT BUTTON"]}
        END
    ELSE
        Fail    ⚠️ Submit button not found — skipping click
    END