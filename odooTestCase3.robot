*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:8069/web/login/
${BROWSER}        Chrome
${CHROMEDRIVER_PATH}        /opt/odoo15/chromedriver
${LUNCH URL}      http://localhost:8069/web#cids=1&menu_id=97&action=135&model=lunch.product&view_type=kanban

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

After Adding to Cart, Order Now test case
    Open the lunch page
    Sleep    4s
    I click on Chicken Curry
    Sleep   4s
    Add to Cart
    Sleep    4s
    I click Order Now
    Sleep    4s
    I should see Ordered
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

I click on Chicken Curry
    Click Element       //*[contains(text(),'Chicken Curry')]

Add to Cart
    Click Element       //*[contains(text(),'Add To Cart')]

I click Order Now
    Click Element       //*[contains(text(),'Order now')]

I should see Ordered
    Page Should Contain              41.90€