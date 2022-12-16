*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${BROWSER}        Chrome
${CHROMEDRIVER_PATH}        /opt/odoo15/chromedriver
${LUNCH URL}      http://localhost:8069/web#cids=1&menu_id=97&action=135&model=lunch.product&view_type=kanban
${CASHMOVES URL}      http://localhost:8069/web#cids=1&menu_id=97&action=128&model=lunch.cashmove&view_type=list
${MITCHELLADMIN URL}      http://localhost:8069/web#id=2&cids=1&menu_id=97&action=128&model=lunch.cashmove&view_type=form

*** Test Cases ***

My login test case
    I want to open odoo login page
    Sleep    3s
    Input my username    admin
    Sleep    3s   
    Input my password    admin
    Sleep    3s
    Submit my credentials
    Sleep    3s   
    I should see this page  
    Sleep    3s   

Change payment type test case
    Open the lunch page
    Sleep    4s
    I click on Manager
    Sleep    4s
    I click on Cash Moves
    Sleep    4s
    I click on Mitchell Admin
    Sleep    4s
    I click edit
    Sleep    4s
    Change form of payment    Payment: 10 lunch tickets (12€)
    Sleep    4s
    I click save
    Sleep    6s
    [Teardown]    Close Browser

*** Keywords ***

I want to open odoo login page
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --start-maximized
    Open Browser    ${LOGIN URl}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}
    Title Should Be    Odoo

Input my username
    [Arguments]    ${username}
    Input Text    login    ${username}

Input my password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit my credentials
    Click Element       //*[contains(text(),'Log in')]

I should see this page
    Title Should Be    Odoo - Discuss

Open the lunch page
    Go To    ${LUNCH URL}

I click on Manager
    Click Element       //*[contains(text(),'Manager')]

I click on Cash Moves
    Go To    ${CASHMOVES URL}

I click on Mitchell Admin
    Go To    ${MITCHELLADMIN URL}

I click edit
    Click Element       //*[contains(text(),'Edit')]

Change form of payment
    [Arguments]    ${description}
    Input Text    description    ${description}

I click save
    Click Element       //*[contains(text(),'Save')]