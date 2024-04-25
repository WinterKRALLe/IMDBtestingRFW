*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Open Browser Clickout Cookies
    • Open Menu
    • Close Menu
________________________________________________________
Pre-conditions:
    Call the Open Browser Clickout Cookies keyword
________________________________________________________
TC_1 Valid Search Query
    • Verify that valid search queries return search results.
    
    1. Enter a valid search query (${ValidQuery}) into the search bar.
    2. Click the search button.
    3. Verify that the search results page contains content.
    4. Confirm that the message "No results found" is not present.
    5. Wait for 2 seconds.

TC_2 Invalid Search Query
    • Verify that invalid search queries return no results.
    
    1. Enter an invalid search query (${InvalidQuery}) into the search bar.
    2. Click the search button.
    3. Verify that the search results page contains content.
    4. Confirm that the message "No results found" is present.
    5. Wait for 2 seconds.

TC_3 Search Results
    • Ensure that search suggestions are displayed when typing a valid search query.
    
    1. Enter a valid search query (${ValidQuery}) into the search bar.
    2. Wait for 3 seconds.
    3. Verify that the search suggestions list is displayed.
    4. Wait for 2 seconds.

TC_4 Search Movie
    • Verify that searching for a movie returns relevant search results.
        
    1. Enter the movie title "The Shawshank Redemption" into the search bar.
    2. Click the search button.
    3. Verify that the page contains an image of Tim Robbins in "The Shawshank Redemption (1994)".

TC_5 Search Actor
    • Confirm that searching for an actor returns relevant search results.
        
    1. Enter the actor's name "Tom Hanks" into the search bar.
    2. Click the search button.
    3. Verify that the page contains an image of Tom Hanks at an event for "Larry Crowne (2011)".

TC_6 Search Director
    • Ensure that searching for a director returns relevant search results.
    
    1. Enter the director's name "Christopher Nolan" into the search bar.
    2. Click the search button.
    3. Verify that the page contains an image of Christopher Nolan at an event for "Inception (2010)".
________________________________________________________
Post-conditions:
    Close the browser.
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Inputs.robot
Resource    ../keywords/Keywords.robot


*** Variables ***
${ValidQuery} =         nobody
${InvalidQuery} =       fdsdfgSDsavs


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

TC_1 Valid Search Query
    Input Text    ${Searchbar}    ${ValidQuery}
    Click Button    ${SearchbarButton}
    Wait Until Page Contains Element    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]
    Element Should Not Contain    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]    No results found
    Sleep    2s

TC_2 Invalid Search Query
    Input Text    ${Searchbar}    ${InvalidQuery}
    Click Button    ${SearchbarButton}
    Wait Until Page Contains Element    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]
    Element Should Contain    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]    No results found
    Sleep    2s

TC_3 Search results
    Input Text    ${Searchbar}    ${ValidQuery}
    Sleep    3s
    Page Should Contain Element    //ul[@class="react-autosuggest__suggestions-list anim-enter-done"]
    Sleep    2s

TC_4 Search Movie
    Input Text    ${Searchbar}    The Shawshank Redemption
    Click Element    ${SearchbarButton}
    Page Should Contain Element    //img[@alt='Tim Robbins in The Shawshank Redemption (1994)']

TC_5 Search Actor
    Input Text    ${Searchbar}    Tom Hanks
    Click Element    ${SearchbarButton}
    Page Should Contain Element    //img[@alt='Tom Hanks at an event for Larry Crowne (2011)']

TC_6 Search Director
    Input Text    ${Searchbar}    Christopher Nolan
    Click Element    ${SearchbarButton}
    Page Should Contain Element    //img[@alt='Christopher Nolan at an event for Inception (2010)']


Post-conditions
    Close Browser
