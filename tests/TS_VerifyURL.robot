*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot


*** Test Cases ***
Verify Homepage URL
    Open Browser    ${URL}    ${Browser}
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${URL}
    Close Browser
