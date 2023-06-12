*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${demo}    //div[@id="demo"]
${trade_card}    //div[@id="demo"]
# ${dropdown}    ${element}[contains(@class, "account-type-dropdown--parent")]    //*[class()="account-type-dropdown--parent"]

*** Test Cases ***
login
    Open Browser    https://app.deriv.com    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    dt_login_button
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail
    Input Text    txtEmail    jiawei@besquare.com.my
    Input Password    txtPass    Jiawei@12345
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    dropdown-display    10
    Click Element    dropdown-display
    Wait Until Element Is Visible    ${demo}
    Click Element    ${demo}
