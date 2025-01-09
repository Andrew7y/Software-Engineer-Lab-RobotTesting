*** Settings ***
Documentation     A test suite with test for invalid registration
Resource          resource.robot
Test Setup        Open Browser To Form Page
Test Teardown     Close Browser
Test Template     Login with Invalid Data Shoud Be Fail


*** Test Cases ***      First Name       Last Name       Destination       Contact Person       Relationship       Email               Phone Number               Error Message
Empty Destination       ${FIRST NAME}    ${LAST NAME}    ${EMPTY}          ${Contact Person}    ${Relationship}    ${EMAI}             ${PHONE NO.}               Please enter your destination.
Empty Email             ${FIRST NAME}    ${LAST NAME}    ${Destination}    ${Contact Person}    ${Relationship}    ${EMPTY}            ${PHONE NO.}               Please enter a valid email address.
Invalid Email           ${FIRST NAME}    ${LAST NAME}    ${Destination}    ${Contact Person}    ${Relationship}    ${Invalid Email}    ${PHONE NO.}               Please enter a valid email address.
Empty Phone Number      ${FIRST NAME}    ${LAST NAME}    ${Destination}    ${Contact Person}    ${Relationship}    ${EMAI}             ${EMPTY}                   Please enter a phone number.
Invalid Phone Number    ${FIRST NAME}    ${LAST NAME}    ${Destination}    ${Contact Person}    ${Relationship}    ${EMAI}             ${Invalid Phone Number}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Keywords ***
Login with Invalid Data Shoud Be Fail
    [Arguments]             ${first_name}    ${last_name}   ${Destination}    ${Contact Person}    ${Relationship}    ${email}    ${PHONE NO.}    ${error_msg}
    Input First Name        ${first_name}
    Input Last Name         ${last_name}
    Input Destination       ${Destination}
    Input Contact Person    ${Contact Person}
    Input Relationship      ${Relationship}
    Input Email             ${email}
    Input Phone Number      ${PHONE NO.}
    Submit Data
    Still On Registration Page
    Error Message Should Be Show    ${error_msg}

Still On Registration Page
    Form Page Should Be Open

Error Message Should Be Show
    [Arguments]    ${error_msg}
    Element Text Should Be    xpath=//p[@id="errors"]    ${error_msg}


