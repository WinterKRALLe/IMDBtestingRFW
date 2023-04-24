*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot


*** Test Cases ***
TC_1 Get Movies Released in 2019
    Input Text    ${Searchbar}    matthew mcconaughey
    Wait Until Element Is Visible    //div[normalize-space()='Matthew McConaughey']
    Click Element    //div[normalize-space()='Matthew McConaughey']
    Element Should Be Visible
    ...    //a[@aria-label='Matthew McConaughey at an event for Mud (2012)']

    @{movies}=    Get WebElements
    ...    xpath=//div[@aria-hidden='false']//a[@role='button'][span[normalize-space()='2019']]
    FOR    ${movie}    IN    @{movies}
        ${movie_name}=    Get Text    ${movie}
        Log    ${movie_name}
    END
    Close Browser
