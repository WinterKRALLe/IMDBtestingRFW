*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Login.robot
Resource    ../keywords/Keywords.robot


*** Variables ***
${formURL}          http://example.com/login
${test_username}    admin
${test_password}    test


*** Test Cases ***
TC_1 Valid Login
    Open Browser    ${URL}    ${Browser}
    Click Element
    ...    //a[@class='ipc-btn ipc-btn--single-padding ipc-btn--center-align-content ipc-btn--default-height ipc-btn--core-baseAlt ipc-btn--theme-baseAlt ipc-btn--on-textPrimary ipc-text-button imdb-header__signin-text']//span[@class='ipc-btn__text'][normalize-space()='Sign In']
    ...
    Wait Until Element Is Visible
    ...    //body/div[@id='wrapper']/div[@id='root']/div[@id='pagecontent']/div[@id='content-2-wide']/div[@id='signin-options']/div/div[1]/a[1]
    Click Element
    ...    //body/div[@id='wrapper']/div[@id='root']/div[@id='pagecontent']/div[@id='content-2-wide']/div[@id='signin-options']/div/div[1]/a[1]
    Login    ${Username}    ${Password}

    Sleep    1s
    Verify Valid Login
    Close Browser

TC_2 Invalid Login

TC_3 Partial Login Username

TC_4 Partial Login Password

TC_5 Empty Login
