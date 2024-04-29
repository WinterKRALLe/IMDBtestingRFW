*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Open Browser Clickout Cookies
    • Search Page
    • Verify Search Result
________________________________________________________
Pre-conditions:
    Call the Open Browser Clickout Cookies keyword
    Login with IMDB account
________________________________________________________
TC_1 Add To Watchlist
    • Verify that the watchlist items are being added to the watchlist.

    1. Check if the watchlist count button is visible.
    2. If the watchlist count button is visible, get the current watchlist count.
    If not, set the watchlist count to 0.
    3. Increment the watchlist count by 1.
    4. Click the watchlist button.
    5. Get the new watchlist count.
    6. Ensure that the new watchlist count equals the incremented count.

TC_2 Add Rating to a Movie
    • Verify that the user can add rating to a movie.

    1. Click on a movie poster.
    2. Ensure that the 'Rate' button does not contain any text.
    3. Click on the 'Rate' button.
    4. Click on the star rating.
    5. Click on the 'Rate' button.
    6. Ensure that the set rating is visible.

TC_3 Sign Out
    • Verify that the user can sign out

    1. Click on the user account button.
    2. Click on the sign-out option.
    3. Ensure that the sign-in link is visible.
________________________________________________________
Post-conditions:
    Close the browser
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../../variables/Browser.robot
Resource    ../../variables/URLs.robot
Resource    ../../variables/Inputs.robot
Resource    ../../variables/Login.robot
Resource    ../../keywords/Keywords.robot


*** Variables ***
${Watchlist_count}
${Watchlist_button}=                (//button[contains(@class, 'ipc-btn') and contains(@class, 'ipc-secondary-button') and contains(@class, 'ipc-btn--core-baseAlt') and contains(@class, 'ipc-btn--theme-baseAlt') and contains(@class, 'ipc-btn--on-accent2') and .//span[text()='Watchlist']])[1]
${Watchlist_link}=                 //a[@role='button']//span[@class='ipc-btn__text'][normalize-space()='Watchlist']
${Watchlist_link_count_button}=    //span[@class='imdb-header__watchlist-button-count watchlistButtonCount']


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies
    Click Element    ${LinkToSignIn}
    Click Element    ${LoginWithImdb}
    Login    ${Username}    ${Password}
    Sleep    1s
    Verify Valid Login

TC_1 Add To Watchlist
    Wait Until Page Contains Element    ${Watchlist_link}
    ${element_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${Watchlist_link_count_button}    timeout=5

    IF    ${element_visible} == ${True}
        ${Watchlist_count}=    Get Text    ${Watchlist_link_count_button}
    ELSE
        ${Watchlist_count}    Set Variable    0
    END
    
    ${Watchlist_count}=    Evaluate    ${Watchlist_count} + 1

    Execute Javascript    window.scrollTo(0, 1500)
    Wait Until Element Is Visible    ${Watchlist_button}    timeout=10s
    Click Element    ${Watchlist_button}
    Wait Until Element Is Visible    ${Watchlist_link_count_button}
    Sleep    .2s
    ${Watchlist_count_new}=    Get Text    ${Watchlist_link_count_button}
    ${Watchlist_count_new}=    Convert To Integer    ${Watchlist_count}
    Should Be Equal    ${Watchlist_count}    ${Watchlist_count_new}

TC_2 Add Rating to a Movie
    Click Element    //div[@class='ipc-poster-card ipc-poster-card--baseAlt ipc-poster-card--dynamic-width top-picks-title ipc-sub-grid-item ipc-sub-grid-item--span-2']//span[@data-testid='title']
    Wait Until Element Is Visible    //div[@class='sc-3a4309f8-0 bjXIAP sc-b7c53eda-1 iIQkEw']//div[@class='sc-e3b78b2c-5 dWdOca'][normalize-space()='Rate']
    Element Should Not Contain    //div[@class='sc-3a4309f8-0 bjXIAP sc-b7c53eda-1 iIQkEw']//div[@class='sc-e3b78b2c-5 dWdOca'][normalize-space()='Rate']    /
    Click Element    //div[@class='sc-3a4309f8-0 bjXIAP sc-b7c53eda-1 iIQkEw']//div[@class='sc-e3b78b2c-5 dWdOca'][normalize-space()='Rate']
    Click Element    //div[@class='ipc-starbar__touch']
    Element Should Be Visible    //div[@class='ipc-rating-prompt__star-display ipc-rating-display']
    Click Button    //button[@class='ipc-btn ipc-btn--single-padding ipc-btn--center-align-content ipc-btn--default-height ipc-btn--core-accent1 ipc-btn--theme-baseAlt ipc-rating-prompt__rate-button']
    Element Should Be Visible    //div[@class='sc-3a4309f8-0 bjXIAP sc-b7c53eda-1 iIQkEw']//span[@class='sc-e3b78b2c-1 dqGYMb']
    Click Element    ${LinkToHome}

TC_03 Sign Out
    Click Element     //label[@class='ipc-btn ipc-btn--single-padding ipc-btn--center-align-content ipc-btn--default-height ipc-btn--core-baseAlt ipc-btn--theme-baseAlt ipc-btn--on-textPrimary ipc-text-button navbar__flyout__text-button-after-mobile navbar__user-menu-toggle__button']
    Element Should Be Visible  //a[@class='ipc-list__item imdb-header-account-menu__sign-out']
    Click Element    //a[@class='ipc-list__item imdb-header-account-menu__sign-out']
    Page Should Contain Element    ${LinkToSignIn}

Post-conditions
    Close Browser


*** Keywords ***
Search Page
    [Arguments]    ${name}
    Input Text    ${Searchbar}    ${name}
    Wait Until Element Is Visible    //div[normalize-space()='${name}']

Verify Search Result
    [Arguments]    ${name}
    Click Element    //div[normalize-space()='${name}']
    Page Should Contain    ${name}
