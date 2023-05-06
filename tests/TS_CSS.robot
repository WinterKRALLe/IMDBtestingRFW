*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot
Resource    ../keywords/Keywords.robot


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}
    Open Menu

TC_1 Underline on Hover
    ${text_decoration}=    Get CSS Property Value
    ...    //a[contains(@class, 'ipc-list__item') and contains(@href, '/chart/top/')]
    ...    text-decoration
    Mouse Over    //a[contains(@class, 'ipc-list__item') and contains(@href, '/chart/top/')]
    ${text_decoration_hover}=    Get CSS Property Value
    ...    //a[contains(@class, 'ipc-list__item') and contains(@href, '/chart/top/')]
    ...    text-decoration
    Should Contain    ${text_decoration_hover}    underline

Post-conditions
    Close Browser
