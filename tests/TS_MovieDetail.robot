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
TC_1 Movie Title
    • Verify that a movie page contains the title

    1. Check if the title of the movie is displayed.

TC_2 Movie Rating
    • Verify that a movie page contains the IMDb rating

    1. Check if the IMDb rating is displayed.

TC_3 Movie Release Year
    • Verify that a movie page contains the release year

    1. Check if the release year of the movie is displayed.

TC_4 Movie Duration
    • Verify that a movie page contains the duration

    1. Check if the duration of the movie is displayed.

TC_5 Movie Genre
    • Verify that a movie page contains the genre

    1. Check if the genre of the movie is displayed.

TC_6 Movie Director
    • Verify that a movie page contains the director

    1. Check if the director of the movie is displayed.

TC_7 Movie Cast
    • Verify that a movie page contains the cast

    1. Check if the cast of the movie is displayed.

TC_8 Movie Storyline
    • Verify that a movie page contains the storyline

    1. Check if the storyline of the movie is displayed.

TC_9 Movie Reviews
    • Verify that a movie page contains the reviews

    1. Check if the reviews of the movie are displayed.
________________________________________________________
Post-conditions:
    Close the browser
________________________________________________________

*** Settings ***
Library     SeleniumLibrary
Resource    ../keywords/Keywords.robot
Resource    ../variables/Inputs.robot

*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies
    Click Element    ${Searchbar}
    Input Text    ${Searchbar}    Guardians of the Galaxy
    Wait Until Element Is Visible    //li[@id='react-autowhatever-navSuggestionSearch--item-0']/a
    Click Element    //li[@id='react-autowhatever-navSuggestionSearch--item-0']/a

TC_1 Movie Title
    Page Should Contain Element    //h1[@class='sc-d8941411-0 khgJYk']/span[@class='hero__primary-text']

TC_2 Movie Rating
    Page Should Contain Element    //div[@class='sc-3a4309f8-0 bjXIAP sc-b7c53eda-1 iIQkEw']//div[@class='sc-acdbf0f3-1 kCTJoV'][normalize-space()='IMDb RATING']

TC_3 Movie Relese Year
    Page Should Contain Element    //a[normalize-space()='Release date']

TC_4 Movie Duration
    Page Should Contain Element    //ul[@class='ipc-inline-list ipc-inline-list--show-dividers sc-d8941411-2 cdJsTz baseAlt']/li[@role='presentation']

TC_5 Movie Genre
    Page Should Contain Element    //div[@class='ipc-chip-list--baseAlt ipc-chip-list']
    
TC_6 Movie Director
    Page Should Contain Element    //div[@class='sc-b7c53eda-3 vXcqY']//span[@aria-label='See full cast and crew'][normalize-space()='Director']

TC_7 Movie Cast
    Page Should Contain Element    //div[@data-testid='title-cast-header']
    Page Should Contain Element    //div[@class='ipc-shoveler ipc-shoveler--base ipc-shoveler--page0 title-cast__grid']

TC_8 Movie Storyline
    Page Should Contain Element    //div[@data-testid='storyline-header']

TC_9 Movie Reviews
    Page Should Contain Element    //div[@data-testid='reviews-header']

Post-conditions
    Close Browser
