*** Variables ***

&{PLACEHOLDERS}
...    FIRST NAME=//input[@placeholder="FIRST NAME (*)"]
...    LAST NAME=//input[@placeholder="LAST NAME (*)"]
...    EMAIL=//input[@placeholder="EMAIL (*)"]
...    PHONE=//input[@placeholder="PHONE"]
...    POSTAL CODE=//input[@placeholder="POSTAL CODE (*)"]
...    MESSAGE=//textarea[@placeholder="MESSAGE (*)"]
...    COMMENTS=//textarea[@placeholder="COMMENTS"]
...    LINCOLN RETAILER=xpath=//select[contains(@class, 'nf-element') and @aria-required='true']
...    HOME PHONE=//input[@placeholder="HOME PHONE (*)"]
...    MOBILE PHONE=//input[@placeholder="MOBILE PHONE"]
...    WORK PHONE=//input[@placeholder="WORK PHONE"]
...    DATE OF BIRTH=//input[@placeholder="DATE OF BIRTH (*)"]
...    SIN=//input[@placeholder="SIN"]
...    MARITAL STATUS=//select[@name="marital_status"]
...    IS COSIGNER AVAILABLE?=//select[@name="cosigner"]
...    CASH DOWN=//input[@placeholder="CASH DOWN"]
...    BANKRUPTCY=//select[@name="bankruptcy"]
...    LICENSE PROVINCE=//input[@placeholder="LICENSE PROVINCE"]
...    EXPIRATION DATE=//input[@placeholder="EXPIRATION DATE"]
...    LICENSE NUMBER=//input[@placeholder="LICENSE NUMBER"]
...    ADDRESS TYPE (CURRENT)=//select[@name="current_address_type"]
...    LINE 1 (CURRENT)=//input[@placeholder="LINE 1 (*)"]
...    LINE 2 (CURRENT)=//input[@placeholder="LINE 2"]
...    CITY (CURRENT)=//input[@placeholder="CITY (*)"]
...    PROVINCE (CURRENT)=//input[@placeholder="PROVINCE (*)"]
...    HOME STATUS (CURRENT)=//select[@name="current_home_status"]
...    YEARS OCCUPIED (CURRENT)=//input[@placeholder="YEARS OCCUPIED (*)"]
...    MONTHS OCCUPIED (CURRENT)=//input[@placeholder="MONTHS OCCUPIED (*)"]
...    RENT PAYMENT (CURRENT)=//input[@placeholder="RENT PAYMENT"]
...    BALANCE OF MORTGAGE (CURRENT)=//input[@placeholder="BALANCE OF MORTGAGE"]
...    VALUE OF HOUSE (CURRENT)=//input[@placeholder="VALUE OF HOUSE"]
...    MONTHLY PAYMENT (CURRENT)=//input[@placeholder="MONTHLY PAYMENT"]
...    ADDRESS TYPE (PREVIOUS)=//select[@name="previous_address_type"]
...    LINE 1 (PREVIOUS)=//input[@placeholder="LINE 1 (*)"]
...    LINE 2 (PREVIOUS)=//input[@placeholder="LINE 2"]
...    CITY (PREVIOUS)=//input[@placeholder="CITY (*)"]
...    PROVINCE (PREVIOUS)=//input[@placeholder="PROVINCE (*)"]
...    POSTAL CODE (PREVIOUS)=//input[@placeholder="POSTAL CODE (*)"]
...    HOME STATUS (PREVIOUS)=//select[@name="previous_home_status"]
...    YEARS OCCUPIED (PREVIOUS)=//input[@placeholder="YEARS OCCUPIED (*)"]
...    MONTHS OCCUPIED (PREVIOUS)=//input[@placeholder="MONTHS OCCUPIED (*)"]
...    RENT PAYMENT (PREVIOUS)=//input[@placeholder="RENT PAYMENT"]
...    BALANCE OF MORTGAGE (PREVIOUS)=//input[@placeholder="BALANCE OF MORTGAGE"]
...    VALUE OF HOUSE (PREVIOUS)=//input[@placeholder="VALUE OF HOUSE"]
...    MONTHLY PAYMENT (PREVIOUS)=//input[@placeholder="MONTHLY PAYMENT"]
...    EMPLOYMENT TYPE (CURRENT)=//select[@name="current_employment_type"]
...    EMPLOYMENT STATUS (CURRENT)=//select[@name="current_employment_status"]
...    EMPLOYER (CURRENT)=//input[@placeholder="EMPLOYER (*)"]
...    OCCUPATION (CURRENT)=//input[@placeholder="OCCUPATION"]
...    YEARS EMPLOYED (CURRENT)=//input[@placeholder="YEARS EMPLOYED"]
...    MONTHS EMPLOYED (CURRENT)=//input[@placeholder="MONTHS EMPLOYED"]
...    MONTHLY INCOME (CURRENT)=//input[@placeholder="MONTHLY INCOME"]
...    SOURCE OF OTHER INCOME (CURRENT)=//input[@placeholder="SOURCE OF OTHER INCOME"]
...    OTHER INCOME (CURRENT)=//input[@placeholder="OTHER INCOME"]
...    EMPLOYMENT TYPE (PREVIOUS)=//select[@name="previous_employment_type"]
...    EMPLOYMENT STATUS (PREVIOUS)=//select[@name="previous_employment_status"]
...    EMPLOYER (PREVIOUS)=//input[@placeholder="EMPLOYER (*)"]
...    OCCUPATION (PREVIOUS)=//input[@placeholder="OCCUPATION"]
...    YEARS EMPLOYED (PREVIOUS)=//input[@placeholder="YEARS EMPLOYED"]
...    MONTHS EMPLOYED (PREVIOUS)=//input[@placeholder="MONTHS EMPLOYED"]
...    MONTHLY INCOME (PREVIOUS)=//input[@placeholder="MONTHLY INCOME"]
...    SOURCE OF OTHER INCOME (PREVIOUS)=//input[@placeholder="SOURCE OF OTHER INCOME"]
...    OTHER INCOME (PREVIOUS)=//input[@placeholder="OTHER INCOME"]
...    SUBMIT BUTTON=//input[@type="submit" and @value="Submit"]


&{FIELD_VALUES}
...    FIRST NAME=    
...    LAST NAME=Doe    
...    EMAIL=robinson@leadboxhq.com    
...    PHONE=416-613-9686    
...    POSTAL CODE=M4M 2A5
...    MESSAGE=i need tires to my toyota   
...    COMMENTS=QA_COMMENTS
...    LINCOLN RETAILER=Downtown Lincoln 
...    HOME PHONE=1111111111
...    MOBILE PHONE=2222222222
...    WORK PHONE=3333333333
...    DATE OF BIRTH=04/16/2025
...    SIN=987654321
...    MARITAL STATUS=Single
...    IS COSIGNER AVAILABLE?=Yes
...    CASH DOWN=1000
...    BANKRUPTCY=Yes
...    LICENSE PROVINCE=Ontario
...    EXPIRATION DATE=04/16/2027
...    LICENSE NUMBER=123456789
...    ADDRESS TYPE (CURRENT)=9150 34 Ave NW, Edmonton, AB, T6E5P2
...    LINE 1 (CURRENT)=QA_LINE1
...    LINE 2 (CURRENT)=QA_LINE2
...    CITY (CURRENT)=Toronto
...    PROVINCE (CURRENT)=Ontario
...    HOME STATUS (CURRENT)=Rent
...    YEARS OCCUPIED (CURRENT)=1
...    MONTHS OCCUPIED (CURRENT)=2
...    RENT PAYMENT (CURRENT)=1000
...    BALANCE OF MORTGAGE (CURRENT)=2000
...    VALUE OF HOUSE (CURRENT)=1000000
...    MONTHLY PAYMENT (CURRENT)=3000
...    ADDRESS TYPE (PREVIOUS)=9150 34 Ave NW, Edmonton, AB, T6E5P2
...    LINE 1 (PREVIOUS)=PREVIOUS_QA_LINE1
...    LINE 2 (PREVIOUS)=PREVIOUS_QA_LINE2
...    CITY (PREVIOUS)=Toronto
...    PROVINCE (PREVIOUS)=Ontario
...    POSTAL CODE (PREVIOUS)=T6E5P2
...    HOME STATUS (PREVIOUS)=Rent
...    YEARS OCCUPIED (PREVIOUS)=3
...    MONTHS OCCUPIED (PREVIOUS)=4
...    RENT PAYMENT (PREVIOUS)=4000
...    BALANCE OF MORTGAGE (PREVIOUS)=5000
...    VALUE OF HOUSE (PREVIOUS)=2000000
...    MONTHLY PAYMENT (PREVIOUS)=6000
...    EMPLOYMENT TYPE (CURRENT)=Sales
...    EMPLOYMENT STATUS (CURRENT)=Full Time
...    EMPLOYER (CURRENT)=QA_EMPLOYEE
...    OCCUPATION (CURRENT)=QA_OCCUPATION
...    YEARS EMPLOYED (CURRENT)=5
...    MONTHS EMPLOYED (CURRENT)=6
...    MONTHLY INCOME (CURRENT)=QA_MONTHLY_INCOME
...    SOURCE OF OTHER INCOME (CURRENT)=QA SOURCE OF OTHER INCOME
...    OTHER INCOME (CURRENT)=QA OTHER INCOME
...    EMPLOYMENT TYPE (PREVIOUS)=Retired
...    EMPLOYMENT STATUS (PREVIOUS)=On Strike
...    EMPLOYER (PREVIOUS)=QA_EMPLOYEE
...    OCCUPATION (PREVIOUS)=QA_OCCUPATION
...    YEARS EMPLOYED (PREVIOUS)=7
...    MONTHS EMPLOYED (PREVIOUS)=8
...    MONTHLY INCOME (PREVIOUS)=9
...    SOURCE OF OTHER INCOME (PREVIOUS)=PREV_QA_SOURCE OF OTHER INCOME 
...    OTHER INCOME (PREVIOUS)=PREV_QA_OTHER INCOME 
...    SUBMIT BUTTON=Submit