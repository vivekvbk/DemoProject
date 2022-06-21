*** Settings ***
Documentation   Validation if title of page is matching
Library         SeleniumLibrary
Library         Collections
Resource    ../resources/resource.robot


*** Variables ***
${actualmsg}        The coupon code you entered couldn´t be applied to your order
${username}     vivekvbk
${password}     12345678vk

*** Test Cases ***

Login into npcommerce
    Opening Browser
    LoginTest
Select product category
    Product selection
switch window and verify page title
    Open Categories
Switch tab and verfiy data
    Switch tab and verfiy product name

Adding product to cart
    cart
    order preview
    Selecting country code
    Closing the browser

*** Keywords ***

     Opening Browser

     LoginTest

Product selection
    Click Element    //span[normalize-space()='Product']
    Sleep    2s
    Click Element    //span[normalize-space()='Store demo']
    Scroll Element Into View    //div[@class='stats-1']//a
    Click Element    //div[@class='stats-1']//a
    ${Title}=   Get Text    //h1[normalize-space()='Showcase. Live shops']
    Log To Console    ${Title}
    Should Be Equal As Strings    ${Title}      Showcase. Live shops
    
Open Categories
    Click Link    //a[normalize-space()='collection.volvocars.com']
    Sleep    3

Switch tab and verfiy product name
    Switch Window       NEW
    Click Element    //input[@name='Private']
    Log To Console    we are on volvo page
    Scroll Element Into View    //a[text()='Kids Thermo Bottle']
    ${productName}=     Get Text    //a[text()='Kids Thermo Bottle']
    Log To Console    ${productName}
    Element Text Should Be    //a[text()='Kids Thermo Bottle']    Kids Thermo Bottle
    ${nameofProduct}=  Get Text    //img[@title='Picture of Kids Thermo Bottle']
    click element   //img[@title='Picture of Kids Thermo Bottle']
    click element    //button[text()='Add to cart']


Cart
    mouse over    //ul[@id='top-nav-menu']//a[@href='/cart']
    click element   //button[@class='btn btn-primary'][normalize-space()='Go to cart']



order preview
    ${addedproduct}=    get text   //*[@id="product-list-cart"]/div/div[2]/div/a
    should be equal     Kids Thermo Bottle (Sand )      ${addedproduct}
    #clear element text    input[class='quantity input']
    #input text    1
    input text     //input[@name='discountcouponcode']       xyz123
    click element    //*[@id="applydiscountcouponcode"]
    ${msg}=     get text    //form[@name='Voucher']/div/p[2]
    log     ${msg}
    should be equal as strings      ${actualmsg} 	   ${msg}

Selecting country code
    click element   //select[@id='CountryCode']
    sleep   2
    select from list by label    //select[@id='CountryCode']    Bahamas
    sleep    3
    scroll element into view    //button[@class='btn btn-primary left add-to-cart-button']
    click element    //button[@class='btn btn-primary left add-to-cart-button']

closing the browser
    close browser



