*** Settings ***
Library      SeleniumLibrary
Library      String
Library      Collections
Library      RequestsLibrary
Library    XML

*** Variables ***
@{chrome_arguments}	    --disable-infobars    --disable-gpu    --window-size=1280,1024
${url}    https://app.deriv.com/
${deposit_btn}    //*[text()="Deposit"]//parent::button
${reset_btn}    //*[text()="Reset Balance"]//parent::button
${demo}    //div[@id="demo"]
${trade_card}    //div[@id="demo"]
${setting_icon}    //a[@href="/account/personal-details"]
${api_token_settings}    //a[@href="/account/api-token"]
${api_settings_page_validation}    //h2[text()="Select scopes based on the access you need."]
${scope}    //label[@class="dc-checkbox"]
${token_name}    //input[@name="token_name"]

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE
Chrome Headless
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}

Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    FOR    ${option}    IN    @{chrome_arguments}
        Call Method    ${options}    add_argument    ${option}
    END
    [Return]    ${options}

Login Account
    Chrome Headless
    Go To   ${url}
    Set window size     1300    800
    Wait Until Page Contains Element    dt_login_button
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail
    Input Text    txtEmail    jiawei@besquare.com.my
    Input Password    txtPass    Jiawei@12345
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10
    Click Element    dropdown-display
    Wait Until Element Is Visible    ${demo}    10
    Click Element    ${demo}
    Wait Until Page Contains Element    ${reset_btn}    10

Open API page
    Click Element    ${setting_icon}
    Wait Until Element Is Visible    ${api_token_settings}    10
    Click Element    ${api_token_settings}
    Wait Until Element Is Visible    ${api_settings_page_validation}    10

Select All Scope
    Wait Until Element Is Visible    (${scope})[1]    10
    Click Element    (${scope})[1]
    Click Element    (${scope})[2]
    Click Element    (${scope})[3]
    Click Element    (${scope})[4]
    Click Element    (${scope})[5]

Fill In Invalid Input
    Click Element    


*** Test Cases ***
#check all trade types and paltforms exist in the main page
All scope with token name
    Login Account
    Open API page
    Select All Scope