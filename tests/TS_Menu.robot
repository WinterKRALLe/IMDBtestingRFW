*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../keywords/Keywords.robot


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

TC_1 Open Menu
    Open Menu

TC_2 Close Menu
    Close Menu

TC_3 Verify Menu
    Open Menu
    Validate Element    //label[@class='navlinkcat__item' and @aria-label='Expand Movies Nav Links']    Movies
    Validate Element    //label[@class='navlinkcat__item' and @aria-label='Expand TV Shows Nav Links']    TV Shows
    Validate Element    //label[@class='navlinkcat__item' and @aria-label='Expand Watch Nav Links']    Watch
    Close Menu

Post-conditions
    Close Browser
