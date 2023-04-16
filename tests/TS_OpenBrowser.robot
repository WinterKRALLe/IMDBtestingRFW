*** Settings ***
Library     SeleniumLibrary    run_on_failure=Nothing
Library     OperatingSystem


*** Variables ***
${ProhlizecChrome}      firefox
${URL}                  https://www.imdb.com/


*** Test Cases ***
Pre-conditions - Otevři browser chrome a jdi na adresu
    Open Browser    ${URL}    ${ProhlizecChrome}

TC_001 - Zkontroluj URL a proveď click event
    Location Should Be    ${URL}

    Wait Until Element Is Visible    //h3[normalize-space()='Featured today']

    Click Element
    ...    //a[@class='ipc-btn ipc-btn--single-padding ipc-btn--center-align-content ipc-btn--default-height ipc-btn--core-baseAlt ipc-btn--theme-baseAlt ipc-btn--on-textPrimary ipc-text-button imdb-header__signin-text']

    ${current_url}=    Get Location

    Append To File    log.html    ${current_url}

    Close Browser
