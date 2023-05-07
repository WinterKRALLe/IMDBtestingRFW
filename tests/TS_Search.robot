*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot


*** Variables ***
${ValidQuery} =         nobody
${InvalidQuery} =       fdsdfgSDsavs


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

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
