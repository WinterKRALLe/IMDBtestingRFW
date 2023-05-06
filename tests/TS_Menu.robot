*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../keywords/Keywords.robot


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

TC_1 Is Menu Opened
    Open Menu

Post-conditions
    Close Browser
