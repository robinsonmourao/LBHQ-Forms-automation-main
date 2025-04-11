** Variables **
${SPREADSHEET_PATH}                         ./Toronto Lincoln.xlsx
${BASE_URL}                                 https://torontolincolndealers.com/contact-us/

${read_alert_text}                          xpath=//div[contains(@class, "nf-error-required-error")]

${input_required_message_by_placeholder}   xpath=//textarea[@placeholder="MESSAGE (*)"]
${input_optional_message_by_placeholder}        xpath=//textarea[@placeholder="MESSAGE"]

${input_additional_vehicle_information_by_placeholder}  xpath=//textarea[contains(@placeholder, 'your vehicle information')]

${select_preferred_transportation_by_id}    id=nf-field-122
${select_preferred_communication_by_id}     id=nf-field-123
${select_lincoln_retailer_by_id}            id=nf-field-220

${input_request_appointment_time_by_id}     id=nf-field-103