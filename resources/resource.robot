*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://www.nopcommerce.com/en
${username}     vivekvbk
${password}     12345678vk

*** Keywords ***



LoginTest
    Mouse Over    (//*[name()='svg'])[2]
    Click Element    //span[normalize-space()='Log in']
    Input Text    id:Username    ${username}
    Input Password    id:Password   ${password}
    Click Button        //input[@value='Log in']


Opening Browser
    Log To Console     Login into Nopcommerce
    Create Webdriver        Chrome      executable_path=/Users/Vivek/Documents/chromedriver
    Go To   ${url}
    Maximize Browser Window

Closing the browser
    Close Browser

