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
