*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

TC_1 Verify Homepage URL
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL}

Post-conditions
    Close Browser
