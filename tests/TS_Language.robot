*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/RadioButtons.robot
Resource    ../variables/HomepageElements.robot
Resource    ../variables/Inputs.robot


*** Variables ***
${text1} =      Regie
${text2} =      Drehbuch
${text3} =      Hauptbesetzung


*** Test Cases ***
Pre-conditions
    Open Browser    ${URL}    ${Browser}

TC_1 English Lang
    ${language}=    Get Text    css=label[for='nav-language-selector'] span.ipc-btn__text
    IF    $language != "EN"
        Click Element    ${LanguageSelector}
        Sleep    .1
        Click Element    ${EnglishLang}
    END
    Page Should Contain Element    ${CarouselTitleEN}
    Page Should Contain Element    ${RecommendationEN}
    Page Should Contain Element    ${ExclusiveEN}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    en

TC_2 French Lang
    ${language}=    Get Text    css=label[for='nav-language-selector'] span.ipc-btn__text
    IF    $language != "FR"
        Click Element    ${LanguageSelector}
        Sleep    .1
        Click Element    ${FrenchLang}
    END
    Page Should Contain Element    ${CarouselTitleFR}
    Page Should Contain Element    ${RecommendationFR}
    Page Should Contain Element    ${ExclusiveFR}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    fr

TC_3 German Lang
    ${language}=    Get Text    css=label[for='nav-language-selector'] span.ipc-btn__text
    IF    $language != "DE"
        Click Element    ${LanguageSelector}
        Sleep    .1
        Click Element    ${GermanLang}
    END
    Page Should Contain Element    ${CarouselTitleDE}
    Page Should Contain Element    ${RecommendationDE}
    Page Should Contain Element    ${ExclusiveDE}

TC_4 German Lang Search
    Click Element    ${Searchbar}
    Input Text    ${Searchbar}    Guardians of the Galaxy
    Wait Until Element Is Visible    //li[@id='react-autowhatever-navSuggestionSearch--item-0']/a
    Click Element    //li[@id='react-autowhatever-navSuggestionSearch--item-0']/a
    Page Should Contain    ${text1}
    Page Should Contain    ${text2}
    Page Should Contain    ${text3}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    de

Post-conditions
    Close Browser
