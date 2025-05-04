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

Detect Fields
    [Arguments]    ${url}
    Open Browser    ${url}   chrome 
    @{fields}=    Get WebElements    xpath=//input[contains(@id, "nf-field")] | //select[contains(@id, "nf-field")] | //textarea[contains(@id, "nf-field")]

    FOR    ${field}    IN    @{fields}
        ${placeholder}=    Get Field Text    ${field}

        # ${value}=        Set Variable    ${FIELD_VALUES["${placeholder}"]}
        # ${is_present}=   Run Keyword And Return Status    Element Should Be Visible    ${xpath}

        # Run Keyword If    ${is_present}    Detect the HTML Field Tag and Inject Values    ${xpath}    ${value}    ${tag}
    END

    Close Browser


Detect the HTML Field Tag and Inject Values
    [Arguments]    ${xpath}    ${value}    ${tag}

    IF    '${tag}' == 'INPUT'
        ${type}=    Get Element Attribute    ${xpath}    type
        IF    '${type}' != 'submit'
            Input Text    ${xpath}    ${value}
        ELSE
            Click Button    ${xpath}
        END
    ELSE IF    '${tag}' == 'TEXTAREA'
        Input Text    ${xpath}    ${value}
    ELSE IF    '${tag}' == 'SELECT'
        Select From List By Value    ${xpath}    ${value}
    ELSE
        Log To Console    ⚠️ Unknown tag: ${tag}
    END

Get Label Text
    [Arguments]    ${label}
    ${input_id}=    Get Element Attribute    ${label}    for
    ${field}=       Get WebElement    xpath=//*[@id="${input_id}"]
    ${placeholder}=    Get Field Text    ${field}

    RETURN    ${placeholder}
    
Get Field Text
    [Arguments]    ${field}
    
    ${tag}=         Get Element Attribute    ${field}    tagName
    
    IF    '${tag}' == 'INPUT'
        ${placeholder}=    Get Element Attribute    ${field}    placeholder
    ELSE IF    '${tag}' == 'SELECT'
        ${placeholder}=    Get Selected List Label    ${field}
    ELSE IF    '${tag}' == 'TEXTAREA'
        ${placeholder}=    Get Text    ${field}
    ELSE
        ${placeholder}=    Set Variable    [unsupported tag: ${tag}]
    END

    IF    '${placeholder}' == 'None' or '${placeholder}' == ''
        ${placeholder}=    Set Variable    [missing placeholder]
    END

    RETURN    ${placeholder}

Get Field ID
    [Arguments]    ${field}

    ${tag}=    Get Element Attribute    ${field}    tagName
    ${id}=    Set Variable    None

    IF    '${tag}' == 'INPUT' or '${tag}' == 'TEXTAREA'
        ${id}=    Get Element Attribute    ${field}    id
    ELSE IF    '${tag}' == 'SELECT'
        ${id}=    Get Element Attribute    ${field}    for    
    END

    IF    "${id}" == "None" or "${id}" == ""
        ${id}=    Set Variable     [unsupported html tag]
    END
    
    RETURN    ${id}


