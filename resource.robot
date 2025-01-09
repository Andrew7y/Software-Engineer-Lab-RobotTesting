*** Settings ***
Documentation      this resource file contain keywords and valiables.
Library            SeleniumLibrary

*** Variables ***
${SERVER}          localhost:7272
${BROWSER}         Chrome
${CHROME_BROWSER_PATH}    C:${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     C:${/}ChromeForTesting${/}chromedriver.exe
${FORM URL}    http://${SERVER}/Form.html
${COMPLETE URL}     http://${server}/Complete.html
${FIRST NAME}      Somsong
${LAST NAME}       Sandee
${Destination}     Europe
${Contact Person}    Sodsai Sandee
${Relationship}    Mother
${EMAI}            somsong@kkumail.com
${PHONE NO.}       081-111-1234
${Invalid Email}   somsong@
${Invalid Phone Number}    191

*** Keywords ***
Start Chrome for Testing
    [Arguments]    ${url}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}     Set Variable     ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    Create Webdriver     Chrome     options=${chrome_options}     service=${service}
    Go To    ${url}

Open Browser To Form Page
    Start Chrome for Testing    ${FORM URL}
    Form Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Complete Page Should Be Open
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.

Input First Name
    [Arguments]    ${first_name}
    Input Text    firstname    ${first_name}

Input Last Name
    [Arguments]    ${last_name}
    Input Text    lastname    ${last_name}

Input Destination
    [Arguments]    ${Destination}
    Input Text    destination    ${Destination}

Input Contact Person
    [Arguments]    ${Contact Person}
    Input Text    contactperson    ${Contact Person}

Input Relationship
    [Arguments]    ${Relationship}
    Input Text    relationship    ${Relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone Number
    [Arguments]    ${PHONE NO.}
    Input Text    phone    ${PHONE NO.}

Submit Data
    Click Button    submitButton







