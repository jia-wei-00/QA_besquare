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
${token_name_input}    //input[@name="token_name"]
${error_outside_range}    //div[text()="Length of token name must be between 2 and 32 characters."]
${error_symbol}    //div[text()="Only letters, numbers, and underscores are allowed."]
${create_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${token_name}    //span[@class="dc-text" and text()="testing"]
${read_scope}    //div[@class="da-api-token__table-scope-cell" and text()="Read"]
${trade_scope}    //div[@class="da-api-token__table-scope-cell" and text()="Trade"]
${payments_scope}    //div[@class="da-api-token__table-scope-cell" and text()="Payments"]
${trading_information}    //div[@class="da-api-token__table-scope-cell" and text()="Trading information"]
${admin_scope}    //div[@class="da-api-token__table-scope-cell da-api-token__table-scope-cell-admin"]
${copy_icon}    (//div[@data-testid="dt_popover_wrapper"])[4]
${copy_modal}    //p[text()="Be careful who you share this token with. Anyone with this token can perform the following actions on your account behalf"]
${copy_modal_ok}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
${token_copied}    //*[text()="Token copied!"]
${eye_icon}    (//div[@data-testid="dt_popover_wrapper"])[5]
${show_token}    //p[@style="--text-size: var(--text-size-xs); --text-color: var(--text-prominent ); --text-lh: var(--text-lh-m); --text-weight: var(--text-weight-normal); --text-align: var(--text-align-left);"]
${delete_btn}    (//div[@data-testid="dt_popover_wrapper"])[6]
${delete_modal_cancel}    //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large dc-dialog__button"]
${delete_confirm_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]
${token_name_without_admin}    //span[@class="dc-text" and text()="no_admin"]