*** Settings ***
Library      SeleniumLibrary
Library      String
Library      Collections
Library      RequestsLibrary
Library    XML
Library    OperatingSystem
Resource    ./variables.robot

*** Keywords ***
Clear Input Field
    [Arguments]    @{inputField}
    Press Keys    ${inputField}    CTRL+a+BACKSPACE

Login Account
    Open Browser    https://app.deriv.com/    Chrome
    Go To   ${url}
    Maximize Browser Window
    Wait Until Page Contains Element    dt_login_button
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail
    Input Text    txtEmail    XXXXX
    Input Password    txtPass    XXXXX
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${deposit_btn}    10

Open Close Account Page
    Click Element    ${setting_icon}
    Wait Until Element Is Visible    ${api_token_settings}    10
    Click Element    ${api_token_settings}
    Wait Until Element Is Visible    ${api_settings_page_validation}    10
    Click Element    ${api_settings_page_validation}

Check On Security And Privacy Documentation
    Wait Until Page Contains Element    ${privacy_policy}    10
    Scroll Element Into View    ${close_acc_title}
    Click Element    ${privacy_policy}
    Switch Window    url=https://deriv.com/tnc/security-and-privacy.pdf
    Close Window
    Switch Window    main

Check Cancel Button
    Click Element    ${cancel_btn}
    Wait Until Element Is Visible    ${setting_icon}

Check Back Button
    Scroll Element Into View    ${back_btn}
    Click Element    ${back_btn}
    Wait Until Page Contains Element    ${close_acc_btn}
    Click Element    ${close_acc_btn}
    Wait Until Page Contains Element    ${continue_btn}

Check Continue Button
    Scroll Element Into View    ${close_acc_title}
    Click Element    ${close_acc_btn}
    Wait Until Page Contains Element    ${second_step_title}    10
    Scroll Element Into View    ${second_step_title}
    Check Back Button
    Wait Until Page Contains Element    ${second_step_title}    10
    Scroll Element Into View    ${second_step_title}
    Element Should Be Disabled    ${continue_btn}
    Input Text    ${input_1}    testing
    Input Text    ${input_2}    testing
    Element Should Be Disabled    ${continue_btn}
    Scroll Element Into View    ${second_step_title}
    Click Element    ${checkbox_1}
    Element Should Be Enabled    ${continue_btn}
    Click Element    ${checkbox_1}
    Element Should Be Disabled    ${continue_btn}
    Click Element    ${checkbox_1}
    Click Element    ${checkbox_2}
    Click Element    ${checkbox_3}
    Element Should Be Disabled    ${checkbox_4}
    Element Should Be Enabled    ${continue_btn}
    Click Element    ${continue_btn}

Check modal
    # Wait Until Element Is Visible    ${back_btn}
    # Click Element    ${back_btn}
    # Wait Until Element Is Visible    ${continue_btn}
    # Click Element    ${continue_btn}
    Wait Until Element Is Visible    ${cloce_acc}
    Click Element    ${cloce_acc}
    Wait Until Element Is Visible    ${check_home}    15

Login Account Template
    Wait Until Page Contains Element    txtEmail
    Input Text    txtEmail    XXXXX
    Input Password    txtPass    XXXXX
    Click Element    //button[@name="login"]

Check Account Login After Close
    Click Element    ${login_btn}
    Login Account Template
    Wait Until Element Is Visible    ${check_open_acc}    10
    Click Element    ${cancel_btn_activate}
    Wait Until Element Is Visible    ${login_btn_activate}    10
    Wait Until Element Is Enabled    ${login_btn_activate}    10
    Click Element    ${login_btn_activate}
    Login Account
    Wait Until Element Is Visible    ${check_open_acc}    10
    Click Element    ${grant}
    Wait Until Element Is Visible    ${acc_info}    10
    
    



    
    




