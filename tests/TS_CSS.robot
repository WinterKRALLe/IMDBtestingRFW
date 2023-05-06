*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot
Resource    ../keywords/Keywords.robot


*** Variables ***
${button}=
...             /html/body/div[@id='__next']/main[@role='main']/div[@role='presentation']/div[@role='presentation']/div[@class='ipc-page-grid ipc-page-grid--bias-left sc-7404859-0 fCDMKW page-grid']/section[@class='ipc-page-section ipc-page-section--baseAlt ipc-page-grid__item ipc-page-grid__item--span-3']/div[@class='top-picks']/div[@class='sc-e3008202-0 cEWmPy']/div[@class='item-enter-done']/div[@role='group']/div[@class='ipc-sub-grid ipc-sub-grid--page-span-3 ipc-sub-grid--nowrap ipc-shoveler__grid']/div[1]/div[3]/button[1]


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

TC_1 Underline on Hover
    Open Menu
    ${text_decoration}=    Get CSS Property Value
    ...    //a[./span[text()='Top 250 Movies']]
    ...    text-decoration
    Mouse Over
    ...    //a[./span[text()='Top 250 Movies']]
    ${text_decoration_hover}=    Get CSS Property Value
    ...    //a[./span[text()='Top 250 Movies']]
    ...    text-decoration
    Should Contain    ${text_decoration_hover}    underline
    Close Menu

TC_2 Text Color
    ${color}=    Get CSS Property Value
    ...    //h3[normalize-space()='Featured today']
    ...    color
    Log    ${color}
    Should Contain    ${color}    rgb(245, 197, 24)

TC_3 Font Size
    ${font_size}=    Get CSS Property Value    //h3[normalize-space()='Featured today']    font-size
    Should Be Equal    ${font_size}    32px

TC_4 Font Weight
    ${font_weight}=    Get CSS Property Value    //h3[normalize-space()='Featured today']    font-weight
    Should Be Equal As Integers    ${font_weight}    500

TC_5 Font Family
    ${font_family}=    Get CSS Property Value    //h3[normalize-space()='Featured today']    font-family
    Should Contain    ${font_family}    Roboto

TC_6 Menu Flex Wrap
    Open Menu
    ${flex_wrap}=    Get CSS Property Value
    ...    //div[@role='presentation'][@class='sc-bYMpWt eTJhNm navlcl'][1]
    ...    flex-wrap
    Should Be Equal    ${flex_wrap}    wrap
    Close Menu

TC_7 Button Border Radius
    ${border_r}=    Get CSS Property Value    ${button}    border-radius
    Should Be Equal    ${border_r}    4px

TC_8 Button Content Center
    ${content_c}=    Get CSS Property Value    ${button}    justify-content
    Should Be Equal    ${content_c}    center

TC_9 Button Cursor Pointer
    ${content_c}=    Get CSS Property Value    ${button}    cursor
    Should Be Equal    ${content_c}    pointer

TC_10 Button Back to Top
    Execute Javascript    window.scrollBy(0, 5000)
    Wait Until Element Is Visible    //button[@aria-label='Back to top']

Post-conditions
    Close Browser
