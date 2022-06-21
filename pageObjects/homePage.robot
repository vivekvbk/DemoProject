*** Settings ***
Documentation   All keywords of homepage will be in this page
Library         SeleniumLibrary
Library         Collections

*** Variables ***


*** Keywords ***

Open Categories
   scroll element into view     //div[normalize-space()='Smart Furniture']
    click link    (//a[normalize-space()='smartfurniture.com'])[1]
    switch window    NEW
    Sleep    5s

search product
    click element    //input[@id="search_query"]
    input text      //input[@id="search_query"]     queen bed
    click element    //button[@type='submit']
    sleep   5s
    ${verification}=  get text    (//h1[contains(text(),'Search Results')])[1]
    log    ${verification}
    Log To Console    ${verification}
    should contain      ${verification}    queen bed

get all product list
    ${products}=    Get WebElements    css:.card-title
    @{actualList}=    Create list
    FOR    ${product}    IN    @{products}
        log         ${product.text}
       log to console    ${product.text}

       #Append to list    @{actualList}    ${product.text}
    END




Product selection
    Click Element    //span[normalize-space()='Product']
    Sleep    2s
    Click Element    //span[normalize-space()='Store demo']
    Scroll Element Into View    //div[@class='stats-1']//a
    Click Element    //div[@class='stats-1']//a
    ${Title}=   Get Text    //h1[normalize-space()='Showcase. Live shops']
    Log To Console    ${Title}
    Should Be Equal As Strings    ${Title}      Showcase. Live shops


