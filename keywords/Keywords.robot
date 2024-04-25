*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/Browser.robot
Resource    ../variables/URLs.robot


*** Keywords ***
Open Browser Clickout Cookies
    Open Browser    ${URL}    ${Browser}
    Wait Until Element Is Visible    //button[@class='icb-btn sc-bcXHqe sc-hLBbgP sc-ftTHYK dcvrLS dufgkr ecppKW']
    Click Button    //button[@class='icb-btn sc-bcXHqe sc-hLBbgP sc-ftTHYK dcvrLS dufgkr ecppKW']
    Wait Until Element Is Not Visible    //button[@class='icb-btn sc-bcXHqe sc-hLBbgP sc-ftTHYK dcvrLS dufgkr ecppKW']

Login
    [Arguments]    ${login}    ${password}
    Wait Until Element Is Enabled    //input[@id='signInSubmit']
    Input Text    //input[@id='ap_email']    ${login}
    Input Password    //input[@id='ap_password']    ${password}
    Click Element    //input[@id='signInSubmit']
    Sleep    1s

Verify Valid Login
    Wait Until Page Contains    Winter

Get CSS Property Value
    [Arguments]    ${locator}    ${attribute name}
    ${css}=    Get WebElement    ${locator}
    ${prop_val}=    Call Method    ${css}    value_of_css_property    ${attribute name}
    RETURN    ${prop_val}

Open Menu
    Element Should Be Visible    //label[@id='imdbHeader-navDrawerOpen']
    Element Should Not Be Visible    //label[@title='Close Navigation Drawer']
    Click Element    //label[@id='imdbHeader-navDrawerOpen']
    Sleep    .2
    Element Should Be Visible    //label[@title='Close Navigation Drawer']

Close Menu
    Element Should Be Visible    //label[@title='Close Navigation Drawer']
    Click Element    //label[@title='Close Navigation Drawer']
    Sleep    .2

Validate Element
    [Arguments]    ${identifier}    ${value}
    Page Should Contain Element    ${identifier}
    Element Text Should Be    ${identifier}    ${value}
