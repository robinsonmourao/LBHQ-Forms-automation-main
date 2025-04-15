** Variables **
${SPREADSHEET_PATH}                         ./Toronto Lincoln.xlsx
${BASE_URL}                                 https://torontolincolndealers.com/contact-us/

${read_alert_text}                          xpath=//div[contains(@class, "nf-error-required-error")]

${input_first_name_by_id}                   name=fname
${input_first_name_by_placeholder}          xpath=//input[@placeholder="FIRST NAME (*)"]

${input_last_name_by_id}                    name=lname
${input_last_name_by_placeholder}           xpath=//input[@placeholder="LAST NAME (*)"]

${input_email_by_id}                        name=email
${input_email_by_placeholder}               xpath=//input[@placeholder="EMAIL (*)"]

${input_phone_by_id}                        name=phone
${input_phone_by_placeholder}               xpath=//input[@placeholder="PHONE"]

${postal_code_input_by_placeholder}          xpath=//input[@placeholder="POSTAL CODE (*)"]

${input_message_by_id}                      id=nf-field-46
${input_required_message_by_placeholder}   xpath=//textarea[@placeholder="MESSAGE (*)"]
${input_optional_message_by_placeholder}        xpath=//textarea[@placeholder="MESSAGE"]

${click_button_by_id}                       xpath=//input[@type="submit"]