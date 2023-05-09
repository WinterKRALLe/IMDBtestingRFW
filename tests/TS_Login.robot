*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Login
    • Verify Valid Login
________________________________________________________
Pre-conditions:
    Open the browser and go to the home page.
    Click the Sign In anchor then click on the
    element that says Sign in with IMDB
________________________________________________________
TC_1 Empty Login
    • Input empty strings into username and password
    fields, it should throw errors

    1. Call the login keyword and pass empty variables as
    arguments.
    2. An alert should appear with text prompting to enter an email
    or mobile phone number.
    3. Another alert should appear with text prompting to enter
    a password.

TC_2 Partial Login Username
    • Input a username into the username field and an empty
    variable into the password field. It should throw an error
    for an empty password.

    1. Call the login keyword and pass the username variable
    as the first argument and an empty variable as the second
    argument.
    2. An alert should appear with text prompting to enter a password.

TC_3 Partial Login Password
    • Input an empty variable into the username field and a
    password variable into the password field. It should
    throw an error for an empty username.

    1. Call the login keyword and pass an empty variable
    as the first argument and a password variable as the second
    argument.
    2. An alert should appear with text prompting to enter a username.

TC_4 Invalid Login
    • Input credentials that do not exist. An alert should
    appear.

    1. Call the login keyword and pass credentials that
    surely do not exist as arguments.
    2. An alert should appear with text indicating that there was a problem.

TC_5 Valid Login with Security Alert
    • After so many attempts, it must throw a security alert
    that requires entering corrupted text as verification.

    1. Call the login keyword and pass valid credentials
    as arguments.
    2. An alert should appear stating "important."

TC_6 Valid Login
    • Logging in with valid credentials and without
    verification. The user should be able to see their
    username instead of the Sign-in anchor.

    1. Call the login keyword and pass valid credentials.
    2. Allow some time for redirection.
    3. Call the Verify Valid Login keyword.
________________________________________________________
Post-conditions:
    Close Browser
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Login.robot
Resource    ../keywords/Keywords.robot


*** Variables ***
${test_username}    pointer2pointer
${test_password}    test
${empty}


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}
    Click Element    ${LinkToSignIn}
    Click Element    ${LoginWithImdb}

TC_1 Empty Login
    Login    ${empty}    ${empty}
    Element Should Be Visible    //div[contains(text(),'Enter your email or mobile phone number')]
    Element Should Be Visible    //div[contains(text(),'Enter your password')]

TC_2 Partial Login Username
    Login    ${test_username}    ${empty}
    Element Should Be Visible    //div[contains(text(),'Enter your password')]

TC_3 Partial Login Password
    Login    ${empty}    ${test_password}
    Element Should Be Visible    //div[contains(text(),'Enter your email or mobile phone number')]

TC_4 Invalid Login
    Login    ${test_username}    ${test_password}
    Page Should Contain    //h4[contains(text(),'There was a problem')]

TC_5 Valid Login with Security Alert
    Login    ${Username}    ${Password}
    Page Should Contain    //h4[contains(text(),'Important Message!')]

TC_6 Valid Login
    Login    ${Username}    ${Password}
    Sleep    1s
    Verify Valid Login

Post-conditions
    Close Browser
