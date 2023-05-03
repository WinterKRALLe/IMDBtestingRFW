*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

TC_1 Is Menu Opened
    Element Should Be Visible    //label[@id='imdbHeader-navDrawerOpen']
    Element Should Not Be Visible    //label[@title='Close Navigation Drawer']
    Click Element    //label[@id='imdbHeader-navDrawerOpen']
    Element Should Be Visible    //label[@title='Close Navigation Drawer']

TC_2 Underline on Hover
    ${text_decoration}=    Get Element Attribute    //a[./span[text()='Top 250 Movies']]    text-decoration
    Log    ${text_decoration}
    Mouse Over    //a[./span[text()='Top 250 Movies']]
    Sleep    1s
    ${text_decoration_hover}=    Get Element Attribute    //a[./span[text()='Top 250 Movies']]    text-decoration
    Log    ${text_decoration_hover}
    Should Be Equal    ${text_decoration_hover}    underline

Post-conditions
    Close Browser
