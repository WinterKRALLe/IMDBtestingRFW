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
TC_1 Valid Search Query
    Open Browser    ${URL}    ${Browser}
    Input Text    ${Searchbar}    ${ValidQuery}
    Click Button    ${SearchbarButton}
    Wait Until Page Contains Element    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]
    Element Should Not Contain    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]    No results found
    Close Browser

TC_2 Invalid Search Query
    Open Browser    ${URL}    ${Browser}
    Input Text    ${Searchbar}    ${InvalidQuery}
    Click Button    ${SearchbarButton}
    Wait Until Page Contains Element    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]
    Element Should Contain    //div[@class="ipc-page-grid__item ipc-page-grid__item--span-2"]    No results found
    Close Browser

TC_3 Search results
    Open Browser    ${URL}    ${Browser}
    Wait Until Page Contains Element    ${Searchbar}
    Input Text    ${Searchbar}    ${ValidQuery}
    Sleep    3s
    Page Should Contain Element    //ul[@class="react-autosuggest__suggestions-list anim-enter-done"]
    Close Browser
