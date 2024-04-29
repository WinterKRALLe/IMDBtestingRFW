*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Open Browser Clickout Cookies
    • Get CSS Property Value
    • Open Menu
    • Close Menu
________________________________________________________
Pre-conditions:
    Call the Open Browser Clickout Cookies keyword
________________________________________________________
TC_1 Underline on Hover
    • Verify that the "Top 250 Movies" link gets underlined when hovered over.
    
    1. Open the menu.
    2. Hover the mouse cursor over the "Top 250 Movies" link.
    3. Confirm that the link's text decoration changes to underline.
    4. Close the menu.

TC_2 Text Color
    • Ensure that the color of the "Featured today" heading is correct.
    
    1. Verify that the color of the "Featured today" heading matches the expected RGB value (245, 197, 24).

TC_3 Font Size
    • Verify that the font size of the "Featured today" heading is correct.
 
    1. Confirm that the font size of the "Featured today" heading is 32 pixels.

TC_4 Font Weight
    • Ensure that the font weight of the "Featured today" heading is correct.
      
    1. Confirm that the font weight of the "Featured today" heading is 500.

TC_5 Font Family
    • Verify that the font family of the "Featured today" heading is correct.
    
    1. Confirm that the font family of the "Featured today" heading contains "Roboto".

TC_6 Menu Flex Wrap
    • Ensure that the menu items wrap correctly when the window size changes.
    
    1. Open the menu.
    2. Verify that the menu items wrap correctly when the window size changes.
    3. Close the menu.

TC_7 Button Border Radius
    • Verify that the border radius of the "Watchlist" button is correct.
    
    1. Scroll to the "Watchlist" button.
    2. Verify that the button's border radius is 4 pixels.

TC_8 Button Content Center
    • Ensure that the content of the "Watchlist" button is centered.
    
    1. Verify that the content of the "Watchlist" button is centered.

TC_9 Button Cursor Pointer
    • Verify that the cursor changes to a pointer when hovering over the "Watchlist" button.
    
    1. Hover the mouse cursor over the "Watchlist" button.
    2. Confirm that the cursor changes to a pointer.

TC_10 Button Back to Top
    • Ensure that the "Back to top" button appears after scrolling down the page.
    
    1. Scroll down the page.
    2. Verify that the "Back to top" button appears.
________________________________________________________
Post-conditions:
    Close Browser
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../../variables/Browser.robot
Resource    ../../variables/URLs.robot
Resource    ../../variables/Inputs.robot
Resource    ../../keywords/Keywords.robot


*** Variables ***
${Watchlist_button}=    (//button[contains(@class, 'ipc-btn') and contains(@class, 'ipc-secondary-button') and contains(@class, 'ipc-btn--core-baseAlt') and contains(@class, 'ipc-btn--theme-baseAlt') and contains(@class, 'ipc-btn--on-accent2') and .//span[text()='Watchlist']])[1]


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

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
    Should Contain    ${color}    rgba(245, 197, 24, 1)

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
    ...    //div[@class='sc-iNiRlI dgDhwo navlcl']
    ...    flex-wrap
    Should Be Equal    ${flex_wrap}    wrap
    Close Menu

TC_7 Button Border Radius
    Execute Javascript    window.scrollBy(0, 2000)
    Wait Until Element Is Visible    ${Watchlist_button}    timeout=10s
    ${border_r}=    Get CSS Property Value    ${Watchlist_button}    border-radius
    Should Be Equal    ${border_r}    4px

TC_8 Button Content Center
    ${content_c}=    Get CSS Property Value    ${Watchlist_button}    justify-content
    Should Be Equal    ${content_c}    center

TC_9 Button Cursor Pointer
    ${content_c}=    Get CSS Property Value    ${Watchlist_button}    cursor
    Should Be Equal    ${content_c}    pointer

TC_10 Button Back to Top
    Execute Javascript    window.scrollBy(0, 5000)
    Wait Until Element Is Visible    //button[@aria-label='Back to top']

Post-conditions
    Close Browser
