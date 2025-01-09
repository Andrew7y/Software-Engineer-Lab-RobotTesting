*** Settings ***
Documentation      this resource file contain test cases.
Resource           resource.robot
Library            SeleniumLibrary

*** Test Cases ***
Test Case 1
    Open Browser To Form Page
    Form Page Should Be Open
    Close Browser

Test Case 2
    Open Browser To Form Page
    Input First Name    ${FIRST NAME}
    Input Last Name    ${LAST NAME}
    Input Destination    ${Destination}
    Input Contact Person    ${Contact Person}
    Input Relationship    ${Relationship}
    Input Email    ${EMAI}
    Input Phone Number    ${PHONE NO.}
    Submit Data
    Complete Page Should Be Open
    Close Browser