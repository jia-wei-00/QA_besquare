*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_btn}    //*[text()="Reset Balance"]//parent::button
${trader_page_btn}    xpath=(//div[@class="trading-app-card__actions"]//button[@class="dc-btn dc-btn--primary"])[1]
${demo}    //div[@id="demo"]
${trade_card}    //div[@id="demo"]
${trade_type}    //div[@class="cq-symbol-select-btn"]
${aud_usd}    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE
    
Selecting Underlying
    Click Element    ${trade_type}
    Wait Until Element Is Visible    ${aud_usd}    10
    Click Element    ${aud_usd}
    Wait Until Element Is Visible    //div[@data-testid="dt_contract_dropdown"]    10
    Click Element    //div[@data-testid="dt_contract_dropdown"]
    Wait Until Element Is Visible    //div[@id="dt_contract_high_low_item"]    10
    Click Element    //div[@id="dt_contract_high_low_item"]

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

check is it real account
    Wait Until Page Contains Element    ${deposit_btn}    10

switch to demo account
    Click Element    dropdown-display
    Wait Until Element Is Visible    ${demo}
    Click Element    ${demo}

check is it demo account
    Wait Until Page Contains Element    ${reset_btn}    10

go to trading page
    Click Element    ${trader_page_btn}
    Wait Until Page Contains Element    ${trade_type}    10

change trade market
    Selecting Underlying

change day
    Wait Until Element Is Visible    //div[@class="dc-input__container"]    10
    Click Element    //div[@class="dc-input__container"]
    Wait Until Element Is Visible    //span[@data-duration="2 Days"]    10
    Click Element    //span[@data-duration="2 Days"]
    Wait Until Element Is Visible    //input[@class="input trade-container__input trade-container__barriers-input trade-container__barriers-single-input" and @value!="${EMPTY}"]

change payout
    Wait Until Page Contains Element    //button[@id="dc_payout_toggle_item"]    10
    Click Element    //button[@id="dc_payout_toggle_item"]
    Wait Until Element Is Visible    //input[@id="dt_amount_input"]    10
    Click Element    //input[@id="dt_amount_input"]
    Clear Input Field    //input[@id="dt_amount_input"]
    Input Text    dt_amount_input    15.50
    Wait Until Element Is Visible    //input[@id="dt_amount_input" and @value="15.50"]