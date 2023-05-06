*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Login
    [Arguments]    ${login}    ${password}

    Input Text    //input[@id='ap_email']    ${login}
    Input Password    //input[@id='ap_password']    ${password}
    Click Button    //input[@id='signInSubmit']

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
    Element Should Be Visible    //label[@title='Close Navigation Drawer']
