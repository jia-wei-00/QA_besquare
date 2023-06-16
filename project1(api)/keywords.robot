*** Settings ***
Library      SeleniumLibrary
Library      String
Library      Collections
Library      RequestsLibrary
Library    XML
Resource    ./variables.robot

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
    Input Text    txtEmail    XXXX
    Input Password    txtPass    XXXX
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
    Wait Until Element Is Visible    ${scope}    timeout=10s
    ${scope_elements}=    Get WebElements    ${scope}
    FOR    ${element}    IN    @{scope_elements}
        Scroll Element Into View    ${element}
        Click Element    ${element}
    END


Fill In Invalid Input
    Click Element    ${token_name_input}
    Input Text    ${token_name_input}    1
    Wait Until Element Is Visible    ${error_outside_range}
    Click Element    ${token_name_input}
    Clear Input Field    ${token_name_input}
    Input Text    ${token_name_input}    &&
    Wait Until Element Is Visible    ${error_symbol}
    Clear Input Field    ${token_name_input}

Fill In Valid Input and Create Token
    Click Element    ${token_name_input}
    Input Text    ${token_name_input}    testing
    Element Should Be Enabled    ${create_btn}
    Click Element    ${create_btn}

Check Token Created
    Wait Until Element Is Visible    ${token_name}
    Wait Until Element Is Visible    ${read_scope}
    Wait Until Element Is Visible    ${trade_scope}
    Wait Until Element Is Visible    ${payments_scope}
    Wait Until Element Is Visible    ${trading_information}
    Wait Until Element Is Visible    ${admin_scope}

Check Copy Token
    Click Element    ${copy_icon}
    Wait Until Element Is Visible    ${copy_modal}    10
    Click Element    ${copy_modal_ok}
    Wait Until Element Is Visible    ${token_copied}    10

Check Show Token Function
    Click Element    ${eye_icon}
    Wait Until Element Is Visible    ${show_token}    10
    Click Element    ${eye_icon}
    Wait Until Element Is Not Visible    ${show_token}    10

Check Delete Function
    Click Element    ${delete_btn}
    Wait Until Element Is Visible    ${delete_modal_cancel}    10
    Click Element    ${delete_modal_cancel}
    Wait Until Element Is Visible    ${token_name}    10
    Click Element    ${delete_btn}
    Wait Until Element Is Visible    ${delete_confirm_btn}    10
    Click Element    ${delete_confirm_btn}
    Wait Until Element Is Not Visible    ${token_name}    10

Check Button Disabled With Token Name
    Element Should Be Disabled    ${create_btn}
    Click Element    ${token_name_input}
    Input Text    ${token_name_input}    no_admin
    Element Should Be Disabled    ${create_btn}

Check Button Disabled With Scopes
    ${scope_elements}=    Get WebElements    ${scope}
    ${read}=    Get From List    ${scope_elements}    0
    ${payment}=    Get From List    ${scope_elements}    2
    Scroll Element Into View    ${read}
    Scroll Element Into View    ${payment}
    Click Element    ${read}
    Click Element    ${payment}
    Element Should Be Enabled    ${create_btn}
    Click Element    ${create_btn}

Check Token Created Without Admin
    Wait Until Element Is Visible    ${token_name_without_admin}
    Wait Until Element Is Visible    ${read_scope}
    Wait Until Element Is Visible    ${payments_scope}
    Click Element    ${delete_btn}
    Wait Until Element Is Visible    ${delete_confirm_btn}    10
    Click Element    ${delete_confirm_btn}
    Wait Until Element Is Not Visible    ${token_name_without_admin}    10



