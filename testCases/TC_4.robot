*** Settings ***
Documentation   End to End Test
Library         SeleniumLibrary
Library         Collections
Library         String
Resource    ../resources/resource.robot
Resource    ../pageObjects/homePage.robot
*** Variables ***

*** Test Cases ***

Login into npcommerce
    Opening Browser
    LoginTest


Select product category
    homePage.Product selection


switch window and verify page title
    homePage.Open Categories


Switch tab and verfiy data
    homePage.search product


Product list page
    homePage.get all product list
    Adding product
    Closing the browser


*** Keywords ***


Adding product
    ${productName}=     get text    (//a[normalize-space()="Versatile 101'' Queen Wall Bed Kit"])[1]
    ${productNamea}=     get webelement  (//a[normalize-space()="Versatile 101'' Queen Wall Bed Kit"])[1]
    log     ${productName}
    ${price}=   get text    //span[normalize-space()='$2,979.99']
    log     ${price}
    set focus to element    (//a[normalize-space()="Versatile 101'' Queen Wall Bed Kit"])[1]
    click element       (//a[normalize-space()="Versatile 101'' Queen Wall Bed Kit"])[1]










