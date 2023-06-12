*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_btn}    //*[text()="Reset Balance"]//parent::button
${trader_page_btn}    xpath=(//div[@class="trading-app-card__actions"]//button[@class="dc-btn dc-btn--primary"])[1]
${demo}    //div[@id="demo"]
${trade_card}    //div[@id="demo"]
${trade_type}    //div[@class="cq-symbol-select-btn"]
${volatility}    (//div[@class="sc-mcd__item__name"])[11]

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE

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
    Click Element    ${trade_type}
    Wait Until Element Is Visible    ${volatility}
    Click Element    ${volatility}

check trade
    Wait Until Element Is Visible    //div[@data-testid="dt_contract_dropdown"]
    Click Element    //div[@data-testid="dt_contract_dropdown"]
    Wait Until Element Is Visible    //div[@id="dc_multipliers_link"]
    Click Element    //div[@id="dc_multipliers_link"]
    Wait Until Element Is Visible    //div[@id="dt_contract_multiplier_item"]
    Click Element    //div[@id="dt_contract_multiplier_item"]
    Wait Until Element Is Not Visible    //div[@id="dc_payout_toggle_item"]
    Wait Until Element Is Visible    //div[@class="trade-container__fieldset-header trade-container__fieldset-header--inline"]

check checkbox
    Click Element    //label[@for="dc_take_profit-checkbox_input"]
    Click Element    //label[@for="dc_stop_loss-checkbox_input"]
    Click Element    //label[@for="dt_cancellation-checkbox_input"]
    Wait Until Element Is Not Visible    //label[@for="dc_take_profit-checkbox_input"]//span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Wait Until Element Is Not Visible    //label[@for="dc_stop_loss-checkbox_input"]//span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Click Element    //label[@for="dc_take_profit-checkbox_input"]
    Wait Until Element Is Not Visible    //label[@for="dt_cancellation-checkbox_input"]//span[@class="dc-checkbox__box dc-checkbox__box--active"]

check multiplier value
    Click Element    //div[@data-testid="dti_dropdown_display"]
    Wait Until Element Is Visible    //div[@id="20"]
    Wait Until Element Is Visible    //div[@id="40"]
    Wait Until Element Is Visible    //div[@id="60"]
    Wait Until Element Is Visible    //div[@id="100"]
    Wait Until Element Is Visible    //div[@id="200"]

deal cancellation stake fee
    Click Element    //label[@for="dt_cancellation-checkbox_input"]
    Wait Until Element Is Not Visible    //label[@for="dc_take_profit-checkbox_input"]//span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Wait Until Element Is Not Visible    //label[@for="dc_stop_loss-checkbox_input"]//span[@class="dc-checkbox__box dc-checkbox__box--active"]
    Click Element    //input[@id="dt_amount_input"]
    Input Text    //input[@id="dt_amount_input"]    100
    ${element_text}=    Get Text    xpath=//span[@data-testid="dt_span"]
    ${value}=    Get Substring    ${element_text}    0    -3
    Should Be True    ${value} > 100

max-min stake
    Click Element    //input[@id="dt_amount_input"]
    Input Text    //input[@id="dt_amount_input"]    20000
    Wait Until Element Is Visible    //*[text()="Maximum stake allowed is 2000.00."]
    Clear Input Field    //input[@id="dt_amount_input"]
    Click Element    //input[@id="dt_amount_input"]
    Input Text    //input[@id="dt_amount_input"]    0
    Wait Until Element Is Visible    //*[text()="Please enter a stake amount that's at least 1.00."]

add sub button
    Click Element    //button[@id="dt_amount_input_add"]
    Wait Until Element Is Visible    //input[@id="dt_amount_input" and @value="1"]
    Click Element    //button[@id="dt_amount_input_sub"]
    Wait Until Element Is Visible    //input[@id="dt_amount_input" and @value="0"]

deal cancellation option
    Click Element    (//div[@id="dropdown-display"])[2]
    Wait Until Element Is Visible    //div[@id="5m"]
    Wait Until Element Is Visible    //div[@id="10m"]
    Wait Until Element Is Visible    //div[@id="15m"]
    Wait Until Element Is Visible    //div[@id="30m"]
    Wait Until Element Is Visible    //div[@id="60m"]
