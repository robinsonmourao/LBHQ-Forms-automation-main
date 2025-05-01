*** Settings ***
Library    SeleniumLibrary

** Keywords **

Click on the submit button
    ${is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${PLACEHOLDERS["SUBMIT BUTTON"]}    5s

    IF    ${is_present}
        Wait Until Keyword Succeeds    5x    1s    Element Should Be Enabled    ${PLACEHOLDERS["SUBMIT BUTTON"]}
        Click Button    ${PLACEHOLDERS["SUBMIT BUTTON"]}
    ELSE
        Log To Console    ⚠️ Submit button not found — skipping click
    END

