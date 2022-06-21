*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/resource.robot
Library         DataDriver      file=../resources/data.csv      encoding=utf_8   dialect=unix
Library     DataDriver
Test Setup    Opening Browser
Test Template       LoginTest
Test Teardown    Closing the browser

*** Variables ***
${url}      https://www.nopcommerce.com/en

*** Test Cases ***

Login with user ${username} and password ${password}    xyz     123434


*** Keywords ***

Opening Browser
    Create Webdriver        Chrome      executable_path=/Users/Vivek/Documents/chromedriver
    Go To       ${url}
    Maximize Browser Window


LoginTest
    [arguments]     ${username}      ${password}
     Mouse Over    (//*[name()='svg'])[2]
    Click Element    //span[normalize-space()='Log in']
    Input Text    id:Username    ${username}
    Input Password    id:Password   ${password}
    Click Button        //input[@value='Log in']


Closing the browser
    Close Browser






