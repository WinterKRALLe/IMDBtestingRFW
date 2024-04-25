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
TC_1 English Lang
    • Verify that the website content is displayed in English language.

    1. Check if the language selector indicates 'EN'.
    2. Click on the English language option.
    3. Ensure that the carousel titles, recommendations, and exclusives are visible.
    4. Verify that the page language attribute is set to 'en'.

TC_2 French Lang
    • Verify that the website content is displayed in French language.

    1. Check if the language selector indicates 'FR'.
    2. Click on the French language option.
    3. Ensure that the carousel titles, recommendations, and exclusives are visible.
    4. Verify that the page language attribute is set to 'fr'.

TC_3 German Lang
    • Verify that the website content is displayed in German language.

    1. Check if the language selector indicates 'DE'.
    2. Click on the German language option.
    3. Ensure that the carousel titles, recommendations, and exclusives are visible.
    4. Verify that the page language attribute is set to 'de'.

TC_4 German Lang Search
    • Verify search functionality with German language.

    1. Enter 'Guardians of the Galaxy' into the search bar.
    2. Click on the suggested movie title.
    3. Check if the director, screenplay, and main cast titles are displayed in German.
    4. Verify that the page language attribute is set to 'de'.
    5. Click on the link to return to the home page.

TC_5 Hindi Lang
    • Verify that the website content is displayed in Hindi language.

    1. Check if the language selector indicates 'HI'.
    2. Click on the Hindi language option.
    3. Ensure that the carousel titles, recommendations, and exclusives are visible.
    4. Verify that the page language attribute is set to 'hi'.

TC_6 Italian Lang
    • Verify that the website content is displayed in Italian language.

    1. Check if the language selector indicates 'IT'.
    2. Click on the Italian language option.
    3. Ensure that the carousel titles, recommendations, and exclusives are visible.
    4. Verify that the page language attribute is set to 'it'.

TC_7 Portugal Lang
    • Verify that the website content is displayed in Portuguese language.

    1. Open a new browser session and ensure cookies are cleared.
    2. Check if the language selector indicates 'PT'.
    3. Click on the Portuguese language option.
    4. Ensure that the carousel titles, recommendations, and exclusives are visible.
    5. Verify that the page language attribute is set to 'pt'.
________________________________________________________
Post-conditions:
    Close Browser
________________________________________________________


*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot
Resource    ../variables/RadioButtons.robot
Resource    ../variables/HomepageElements.robot
Resource    ../variables/Inputs.robot
Resource    ../keywords/Keywords.robot

*** Variables ***
${text1} =      Regie
${text2} =      Drehbuch
${text3} =      Hauptbesetzung

*** Test Cases ***
Pre-conditions
    Open Browser Clickout Cookies

TC_1 English Lang
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "EN"
        Click Element    ${LanguageSelector}
        Click Element    ${EnglishLang}
    END
    Page Should Contain Element    ${CarouselTitleEN}
    Page Should Contain Element    ${RecommendationEN}
    Page Should Contain Element    ${ExclusiveEN}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    en

TC_2 French Lang
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "FR"
        Click Element    ${LanguageSelector}
        Click Element    ${FrenchLang}
    END
    Page Should Contain Element    ${CarouselTitleFR}
    Page Should Contain Element    ${RecommendationFR}
    Page Should Contain Element    ${ExclusiveFR}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    fr

TC_3 German Lang
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "DE"
        Click Element    ${LanguageSelector}
        Click Element    ${GermanLang}
    END
    Page Should Contain Element    ${CarouselTitleDE}
    Page Should Contain Element    ${RecommendationDE}
    Page Should Contain Element    ${ExclusiveDE}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    de

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
    Click Element    ${LinkToHome}

TC_5 Hindi Lang
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "HI"
        Click Element    ${LanguageSelector}
        Click Element    ${HindiLang}
    END
    Page Should Contain Element    ${CarouselTitleHI}
    Page Should Contain Element    ${RecommendationHI}
    Page Should Contain Element    ${ExclusiveHI}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    hi

TC_6 Italian Lang
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "IT"
        Click Element    ${LanguageSelector}
        Click Element    ${ItalianLang}
    END
    Page Should Contain Element    ${CarouselTitleIT}
    Page Should Contain Element    ${RecommendationIT}
    Page Should Contain Element    ${ExclusiveIT}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    it

TC_7 Portugal Lang
    Open Browser Clickout Cookies
    ${language}=    Get Text    ${LanguageSelector}
    IF    $language != "PT"
        Click Element    ${LanguageSelector}
        Click Element    ${PortugalLang}
    END
    Page Should Contain Element    ${CarouselTitlePT}
    Page Should Contain Element    ${RecommendationPT}
    Page Should Contain Element    ${ExclusivePT}
    ${lang}=    Get Element Attribute    //html    lang
    Should Contain    ${lang}    pt

Post-conditions
    Close Browser