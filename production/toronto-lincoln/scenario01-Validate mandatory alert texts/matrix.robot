*** Variables ***
@{TEST_MATRIX}

&{PLACEHOLDERS}
...    FIRST NAME=//input[@placeholder="FIRST NAME (*)"]
...    LAST NAME=//input[@placeholder="LAST NAME (*)"]
...    EMAIL=//input[@placeholder="EMAIL (*)"]
...    PHONE=//input[@placeholder="PHONE"]
...    POSTAL CODE=//input[@placeholder="POSTAL CODE (*)"]
...    MESSAGE=//textarea[@placeholder="MESSAGE (*)"]
...    LINCOLN RETAILER=xpath=//select[contains(@class, 'nf-element') and @aria-required='true']

&{FIELD_VALUES}
...    FIRST NAME=    
...    LAST NAME=Doe    
...    EMAIL=robinson@leadboxhq.com    
...    PHONE=416-613-9686    
...    POSTAL CODE=M4M 2A5
...    MESSAGE=i need tires to my toyota
...    LINCOLN RETAILER=Downtown Lincoln

