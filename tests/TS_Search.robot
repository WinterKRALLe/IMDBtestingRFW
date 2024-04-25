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

Post-conditions
    Close Browser
