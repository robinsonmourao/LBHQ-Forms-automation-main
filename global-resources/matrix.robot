*** Variables ***

&{PLACEHOLDERS}
...    FIRST NAME=//input[contains(@placeholder, "FIRST NAME")]
...    LAST NAME=//input[contains(@placeholder, "LAST NAME")]
...    EMAIL=//input[contains(@placeholder, "EMAIL")]
...    PHONE=//input[contains(@placeholder, "PHONE")]
# ...    DATE=//input[contains(@placeholder, "DATE")]
# ...    PREFERRED DATE=//input[contains(@placeholder, "PREFERRED DATE")]
...    TIME=//select[contains(@placeholder, "TIME")]
...    YEAR=//input[contains(@placeholder, "YEAR")]
...    MAKE=//input[contains(@placeholder, "MAKE")]
...    MODEL=//input[contains(@placeholder, "MODEL")]
...    MILEAGE=//input[contains(@placeholder, "MILEAGE")]
...    ODOMETER=//input[contains(@placeholder, "ODOMETER")]
...    COLOUR=//input[contains(@placeholder, "COLOUR")]
...    POSTAL CODE=//input[contains(@placeholder, "POSTAL CODE")]
...    MESSAGE=//textarea[contains(@placeholder, "MESSAGE")]
...    COMMENTS=//textarea[@placeholder="COMMENTS"]
...    PLEASE INCLUDE ADDITIONAL INFORMATION=//input[@placeholder="Please include"]
...    TYPE OF SERVICE NEEDED=//input[contains(@placeholder, "Type of service needed")]
# ...    LINCOLN RETAILER=xpath=//select[contains(@class, 'nf-element') and @aria-required='true']
...    HOME PHONE=//input[contains(@placeholder, "HOME PHONE")]
...    MOBILE PHONE=//input[contains(@placeholder, "MOBILE PHONE")]
...    WORK PHONE=//input[contains(@placeholder, "WORK PHONE")]
...    DATE OF BIRTH=//input[contains(@placeholder, "DATE OF BIRTH")]
...    SIN=//input[contains(@placeholder, "SIN")]
...    MARITAL STATUS=//select[@name="marital_status"]
...    IS COSIGNER AVAILABLE?=//select[@name="cosigner"]
...    CASH DOWN=//input[contains(@placeholder, "CASH DOWN")]
...    BANKRUPTCY=//select[@name="bankruptcy"]
...    LICENSE PROVINCE=//input[contains(@placeholder, "LICENSE PROVINCE")]
...    EXPIRATION DATE=//input[contains(@placeholder, "EXPIRATION DATE")]
...    LICENSE NUMBER=//input[contains(@placeholder, "LICENSE NUMBER")]
...    ADDRESS TYPE (CURRENT)=//select[@name="current_address_type"]
...    LINE 1 (CURRENT)=//input[contains(@placeholder, "LINE 1")]
...    LINE 2 (CURRENT)=//input[contains(@placeholder, "LINE 2")]
...    CITY (CURRENT)=//input[contains(@placeholder, "CITY")]
...    PROVINCE (CURRENT)=//input[contains(@placeholder, "PROVINCE")]
...    HOME STATUS (CURRENT)=//select[@name="current_home_status"]
...    YEARS OCCUPIED (CURRENT)=//input[contains(@placeholder, "YEARS OCCUPIED")]
...    MONTHS OCCUPIED (CURRENT)=//input[contains(@placeholder, "MONTHS OCCUPIED")]
...    RENT PAYMENT (CURRENT)=//input[contains(@placeholder, "RENT PAYMENT")]
...    BALANCE OF MORTGAGE (CURRENT)=//input[contains(@placeholder, "BALANCE OF MORTGAGE")]
...    VALUE OF HOUSE (CURRENT)=//input[contains(@placeholder, "VALUE OF HOUSE")]
...    MONTHLY PAYMENT (CURRENT)=//input[contains(@placeholder, "MONTHLY PAYMENT")]
...    ADDRESS TYPE (PREVIOUS)=//select[@name="previous_address_type"]
...    LINE 1 (PREVIOUS)=//input[contains(@placeholder, "LINE 1")]
...    LINE 2 (PREVIOUS)=//input[contains(@placeholder, "LINE 2")]
...    CITY (PREVIOUS)=//input[contains(@placeholder, "CITY")]
...    PROVINCE (PREVIOUS)=//input[contains(@placeholder, "PROVINCE")]
...    POSTAL CODE (PREVIOUS)=//input[contains(@placeholder, "POSTAL CODE")]
...    HOME STATUS (PREVIOUS)=//select[@name="previous_home_status"]
...    YEARS OCCUPIED (PREVIOUS)=//input[contains(@placeholder, "YEARS OCCUPIED")]
...    MONTHS OCCUPIED (PREVIOUS)=//input[contains(@placeholder, "MONTHS OCCUPIED")]
...    RENT PAYMENT (PREVIOUS)=//input[contains(@placeholder, "RENT PAYMENT")]
...    BALANCE OF MORTGAGE (PREVIOUS)=//input[contains(@placeholder, "BALANCE OF MORTGAGE")]
...    VALUE OF HOUSE (PREVIOUS)=//input[contains(@placeholder, "VALUE OF HOUSE")]
...    MONTHLY PAYMENT (PREVIOUS)=//input[contains(@placeholder, "MONTHLY PAYMENT")]
...    EMPLOYMENT TYPE (CURRENT)=//select[@name="current_employment_type"]
...    EMPLOYMENT STATUS (CURRENT)=//select[@name="current_employment_status"]
...    EMPLOYER (CURRENT)=//input[contains(@placeholder, "EMPLOYER")]
...    OCCUPATION (CURRENT)=//input[contains(@placeholder, "OCCUPATION")]
...    YEARS EMPLOYED (CURRENT)=//input[contains(@placeholder, "YEARS EMPLOYED")]
...    MONTHS EMPLOYED (CURRENT)=//input[contains(@placeholder, "MONTHS EMPLOYED")]
...    MONTHLY INCOME (CURRENT)=//input[contains(@placeholder, "MONTHLY INCOME")]
...    SOURCE OF OTHER INCOME (CURRENT)=//input[contains(@placeholder, "SOURCE OF OTHER INCOME")]
...    OTHER INCOME (CURRENT)=//input[contains(@placeholder, "OTHER INCOME")]
...    EMPLOYMENT TYPE (PREVIOUS)=//select[@name="previous_employment_type"]
...    EMPLOYMENT STATUS (PREVIOUS)=//select[@name="previous_employment_status"]
...    EMPLOYER (PREVIOUS)=//input[contains(@placeholder, "EMPLOYER")]
...    OCCUPATION (PREVIOUS)=//input[contains(@placeholder, "OCCUPATION")]
...    YEARS EMPLOYED (PREVIOUS)=//input[contains(@placeholder, "YEARS EMPLOYED")]
...    MONTHS EMPLOYED (PREVIOUS)=//input[contains(@placeholder, "MONTHS EMPLOYED")]
...    MONTHLY INCOME (PREVIOUS)=//input[contains(@placeholder, "MONTHLY INCOME")]
...    SOURCE OF OTHER INCOME (PREVIOUS)=//input[contains(@placeholder, "SOURCE OF OTHER INCOME")]
...    OTHER INCOME (PREVIOUS)=//input[contains(@placeholder, "OTHER INCOME")]
...    MY EMAIL HERE=//input[contains(@placeholder, "My email here")]
...    SUBMIT BUTTON=//input[@type="submit"]
...    ALERT TEXT=//xpath=//div[contains(@class, "nf-error")]


&{FIELD_VALUES}
...    FIRST NAME=   
...    LAST NAME=Doe    
...    EMAIL=robinson@leadboxhq.com    
...    PHONE=416-613-9686 
...    DATE=06/22/2025
...    PREFERRED DATE=06/22/2026
...    TIME=Morning
...    YEAR=2021
...    MAKE=Tesla
...    MODEL=3
...    MILEAGE=12000
...    ODOMETER=14000
...    COLOUR=White
...    POSTAL CODE=M4M 2A5
...    MESSAGE=i need tires to my tesla   
...    COMMENTS=QA_COMMENTS
...    PLEASE INCLUDE ADDITIONAL INFORMATION=QA_ADDITIONAL-INFORMATION
...    TYPE OF SERVICE NEEDED=Tires replacing
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
...    MY EMAIL HERE=
...    SUBMIT BUTTON=Submit