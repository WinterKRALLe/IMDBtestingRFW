*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/Inputs.robot


*** Test Cases ***
TC_1 Search Person
    Open Browser to Search Page for Person
    Click on Matthew McConaughey result
    Close Browser

TC_2 Get Person's Movies Released in 2019
    Open Browser to Search Page for Person
    Click on Matthew McConaughey result
    @{movie_elements} =    Get WebElements
    ...    //div[contains(@class, 'ipc-metadata-list-summary-item__c')]//a[contains(@class, 'ipc-metadata-list-summary-item__t')][../following-sibling::div//span[contains(@class, 'ipc-metadata-list-summary-item__li') and text()='2019']]
    @{movie_names} =    Create List
    FOR    ${movie_element}    IN    @{movie_elements}
        Append To List    ${movie_names}    ${movie_element.text}
    END
    Log Many    @{movie_names}
    Close Browser

TC_3 Get Person's Awards
    Open Browser to Search Page for Person
    Click on Matthew McConaughey result
    Click Element    //a[normalize-space()='Awards']
    @{elements} =    Get WebElements    //a[@class="ipc-title-link-wrapper"]//h3[@class="ipc-title__text"]//span[1]
    @{text_list} =    Create List
    FOR    ${element}    IN    @{elements}
        Append To List    ${text_list}    ${element.text}
    END
    Log Many    ${text_list}
    Close Browser

TC_4 Search Title
    Open Browser to Search Page for Title
    Click on Nobody result
    Close Browser


*** Keywords ***
Open Browser to Search Page for Person
    Open Browser    ${URL}    ${Browser}
    Input Text    ${Searchbar}    matthew mcconaughey
    Wait Until Element Is Visible    //div[normalize-space()='Matthew McConaughey']

Click on Matthew McConaughey result
    Click Element    //div[normalize-space()='Matthew McConaughey']
    Element Should Be Visible
    ...    //a[@aria-label='Matthew McConaughey at an event for Mud (2012)']

Open Browser to Search Page for Title
    Open Browser    ${URL}    ${Browser}
    Input Text    ${Searchbar}    nobody
    Wait Until Element Is Visible    //div[normalize-space()='Nobody']

Click on Nobody result
    Click Element    //div[normalize-space()='Nobody']
    Element Should Be Visible
    ...    //a[contains(text(), 'Nobody')]
