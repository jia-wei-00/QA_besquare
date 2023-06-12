*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${chk_btn}    //*[text()="Check trading specs"]//parent::a
${trd_btn}    //*[text()="Trade now"]//parent::button
${markets}    //*[text()="Markets"]//parent::p

*** Test Cases ***
login
    Open Browser    https://deriv.com    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    ${trd_btn}    10
    Wait Until Page Contains Element    ${chk_btn}    10
    Scroll Element Into View    ${chk_btn}
    Mouse Over    ${markets}
    Wait Until Element Is Visible    //*[text()="Forex"]//parent::h2
    Click Element    //*[text()="Forex"]//parent::h2
    Wait Until Page Contains Element    //*[text()="CFDs"]//parent::h4    10
    Scroll Element Into View    //*[text()="CFDs"]//parent::h4
    


    