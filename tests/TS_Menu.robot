*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Open Browser Clickout Cookies
________________________________________________________
Pre-conditions:
    Call the Open Browser Clickout Cookies keyword
________________________________________________________
TC_1 Open Menu
    • Verify that the menu opens successfully

    1. Click on the menu button.
    2. Check if the menu expands and displays the navigation links.

TC_2 Close Menu
    • Verify that the menu closes successfully

    1. Click on the close button or anywhere outside the menu.
    2. Check if the menu collapses and hides the navigation links.

TC_3 Verify Menu
    • Verify the presence of specific menu items

    1. Open the menu.
    2. Check if the 'Movies' navigation link is present.
    3. Check if the 'TV Shows' navigation link is present.
    4. Check if the 'Watch' navigation link is present.
    5. Close the menu.
________________________________________________________
Post-conditions:
    Close the browser
________________________________________________________

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
