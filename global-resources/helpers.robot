*** Keywords ***
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
        IF    '${placeholder}' == 'None' or '${placeholder}' == ''
            ${placeholder}=    Set Variable    [missing placeholder]
        ELSE
            ${placeholder}=    Set Variable    [unsupported tag: ${tag}]            
        END
    END

    RETURN    ${placeholder}

Get Label ID
    [Arguments]    ${label}
    ${input_id}=    Get Element Attribute    ${label}    for

    RETURN    ${input_id}

Get Field ID
    [Arguments]    ${field}

    ${tag}=    Get Element Attribute    ${field}    tagName
    ${id}=    Set Variable    None

    Log To Console    ${tag}

    IF    '${tag}' == 'INPUT' or '${tag}' == 'TEXTAREA'
        ${id}=    Get Element Attribute    ${field}    id
    ELSE IF    '${tag}' == 'SELECT'
        ${id}=    Get Element Attribute    ${field}    for    
    END

    IF    "${id}" == "None" or "${id}" == ""
        ${id}=    Set Variable     [unsupported html tag]
    END
    
    RETURN    ${id}
