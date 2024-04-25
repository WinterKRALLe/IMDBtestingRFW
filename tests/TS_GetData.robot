*** Comments ***
________________________________________________________

    Manual Test Cases
________________________________________________________
Keywords:
    • Search Page
    • Verify Search Result
________________________________________________________
Pre-conditions:
    Open the browser and go to the home page.
________________________________________________________
TC_1 Search Person
    • Search for a person and verify that the page is
    about him

    1. Call Search Page keyword with an argument.
    2. Call Verify Search Result keyword with the argument,
    page should contain person's name.

TC_2 Get Person's Movies Released in 2019
    • Collect all movies made in 2019 and add them to a list,
    then compare the list with the one already inicialized

    1. Collect all movies made in 2019
    2. Create a list
    3. Append movies to the list
    4. Create a list with known movies
    5. Compare those lists

TC_3 Search Title
    • Page is able to search for a person and it should be
    able to search for a movie's title

    1. Call Search Page keyword with an argument.
    2. Call Verify Search Result keyword with the argument,
    page should contain movies's title.
________________________________________________________
Post-conditions:
    Close the browser
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot
Resource    ../keywords/Keywords.robot


*** Variables ***
${person}       Matthew McConaughey
${title}        Nobody


*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

TC_1 Search Person
    Search Page    ${person}
    Verify Search Result    ${person}

TC_2 Get Person's Movies Released in 2019
    @{movie_elements} =    Get WebElements
    ...    //div[contains(@class, 'ipc-metadata-list-summary-item__c')]//a[contains(@class, 'ipc-metadata-list-summary-item__t')][../following-sibling::div//span[contains(@class, 'ipc-metadata-list-summary-item__li') and text()='2019']]
    @{movie_names} =    Create List
    FOR    ${movie_element}    IN    @{movie_elements}
        Append To List    ${movie_names}    ${movie_element.text}
    END
    ${expected_movie_names} =    Create List
    ...    The Gentlemen
    ...    Between Two Ferns: The Movie
    ...    The Beach Bum
    ...    Serenity
    ...    ${EMPTY}
    Lists Should Be Equal    ${movie_names}    ${expected_movie_names}

TC_3 Search Title
    Search Page    ${title}
    Verify Search Result    ${title}

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
