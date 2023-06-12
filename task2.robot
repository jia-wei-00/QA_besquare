*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_btn}    //*[text()="Reset Balance"]//parent::button
${trader_page_btn}    xpath=(//div[@class="trading-app-card__actions"]//button[@class="dc-btn dc-btn--primary"])[1]
${demo}    //div[@id="demo"]
${trade_card}    //div[@id="demo"]
${trade_type}    //div[@class="cq-symbol-select-btn"]
${volatility}    (//div[@class="sc-mcd__item__name"])[7]

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
    Wait Until Page Contains Element    //button[@id="dc_t_toggle_item"]//span[text()="Ticks"]    50
    Wait Until Element Is Visible    //span[@id="dt_range_slider_label" and text()="5 Ticks"]
    Wait Until Element Is Visible    //input[@id="dt_amount_input" and @value="10"]

trade rise
    Wait Until Page Contains Element    //button[@class="btn-purchase btn-purchase--1"]    10
    Click Element    //button[@class="btn-purchase btn-purchase--1"]