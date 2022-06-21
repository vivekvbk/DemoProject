*** Settings ***
Library         SeleniumLibrary
Test Setup      Opening Browser
Test Teardown       Close Browser
Test Template       LoginTest
Resource        ../resources/wait.py
#Library     DataDriver      file=../resources/data.csv      encoding=utf_8   dialect=unix


*** Variables ***
#${username}     vivekvbk
#{password}     12345678vk
${url}      https://www.nopcommerce.com/en

*** Test Cases ***      username        password        currentUrl
Valid credentials        vivekvbk     12345678vk       https://www.nopcommerce.com/en
Invalid credentials        uio     fhsdjsKl    https://www.nopcommerce.com/en/login?returnurl=%2Fen



*** Keywords ***

Opening Browsee
   Create Webdriver        Chrome      executable_path=/Users/Vivek/Documents/chromedriver
    Go To       ${url}
    Maximize Browser Window


LoginTest
    [Arguments]     ${username}        ${password}      ${currentUrl}
    Mouse Over    (//*[name()='svg'])[2]
    Click Element    //span[normalize-space()='Log in']
    Input Text    id:Username    ${username}
    Input Password    id:Password   ${password}
    Click Button        //input[@value='Log in']
    sleep  2s
    ${currentpageUrl}=   get location
    log to console      ${currentpageUrl}
    seleniumlibrary.location should be    ${currentUrl}

Closing the browser
    close browser








