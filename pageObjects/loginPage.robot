*** Settings ***
Documentation   All keywords of loginpage will be in this page
Library         SeleniumLibrary


*** Variables ***
${url}      https://www.nopcommerce.com/en


*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***


Opening Browser
    Log To Console     Login into Nopcommerce
    Create Webdriver        Chrome      executable_path=/Users/Vivek/Documents/chromedriver
    Go To   ${url}
    Maximize Browser Window


LoginTest
    [Arguments]     ${username}        ${password}
    Mouse Over    (//*[name()='svg'])[2]
    Click Element    //span[normalize-space()='Log in']
    Input Text    id:Username    ${username}
    Input Password    id:Password   ${password}
    Click Button        //input[@value='Log in']
    sleep  2s
    ${currentUrl}=   get location
    log to console      ${currentUrl}
    location should contain  ${currentUrl}