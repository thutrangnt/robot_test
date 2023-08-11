*** Settings ***
Documentation    This is some basic infor about the whole suite
Library          SeleniumLibrary
*** Variables ***


*** Test Cases ***
Should be able to add new customer
    [Documentation]         This is some basic info about the test
#      Tag : ID, feature, ...
    [Tags]                  1006    Smoke   Contacts
#    Initialize selenium
    set selenium speed      .2s
    set selenium timeout    10s

#    open the browser
#    log : to provide info at any time during your test
    log                     Starting the test case!
    open browser            https://automationplayground.com/crm/    chrome
#   Resize browser window for recording
    set window position     x=341    y=169
    set window size         width=1935  height=1090

    wait until page contains     Customers Are Priority One

    click link              login.html    # Sign In
    page should contain     Login

    input text              id=email-id     admin@robotframeworktutorial.com
    input text              id=password     qwe
    click button            Submit
    page should contain     Our Happy Customers

    click link              id=new-customer
    wait until page contains     Add Customer

    input text              id=EmailAddress     janedoe@gmail.com
    input text              id=FirstName        Trang
    input text              id=LastName         Nguyen
    input text              id=City             Dallos
    select from list by value    id=StateOrRegion       TX
    select radio button     gender              female
    select checkbox         name=promos-name
    click button            Submit
    wait until page contains    Success! New customer added.


    sleep                   3s
    close browser


*** Keywords ***
