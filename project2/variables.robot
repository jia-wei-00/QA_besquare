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
${api_settings_page_validation}    //a[@id="dc_close-your-account_link"]

#close account first page
${close_acc_title}    //p[@class="dc-text closing-account__information--bold"]
${privacy_policy}    //a[@class="link"]
${pdf}    //embed[@name="A61527B203F34A145D7CD284A505721A"]
${cancel_btn}    //button[@class="dc-btn dc-btn--secondary dc-btn__large closing-account__button--cancel"]
${close_acc_btn}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

#second page
${second_step_title}    //p[@class="dc-text closing-account-reasons__title"]
${continue_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${input_1}    //textarea[@placeholder="If you don’t mind sharing, which other trading platforms do you use?"]
${input_2}    //textarea[@placeholder="What could we do to improve?"]
${checkbox_1}    //*[@class="closing-account-reasons"]/form/label[9]
${checkbox_2}    //*[@class="closing-account-reasons"]/form/label[8]
${checkbox_3}    //*[@class="closing-account-reasons"]/form/label[7]
${checkbox_4}    //*[@class="closing-account-reasons"]/form/label[6]/input
${button_form}    //div[@class="dc-form-submit-button dc-form-submit-button--relative"]
${back_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]

#modal
${dlt_acc_modal}    //div[@class="account-closure-warning-modal"]
${back_btn}    (//button[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"])[2]
${cloce_acc}    (//button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"])[2]

#homepage
${check_home}    //button[@id="dm-hero-signup"]
${login_btn}    //button[@class="button primary outlined text-small typography-weight-bold"]
${check_open_acc}    //h2[text()="Want to start trading on Deriv again?"]
${cancel_btn_activate}    //button[@id="btnCancel"]
${login_btn_activate}    //button[@id="dt_login_button"]
${grant}    //button[@id="btnGrant"]
${acc_info}    //div[@data-testid="dt_acc_info"]
