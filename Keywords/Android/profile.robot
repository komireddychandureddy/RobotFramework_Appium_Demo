*** Settings ***
Resource          ../../Config/super.robot

*** Keywords ***
Create a new user
    [Arguments]    ${Username}    ${Email}    ${Password}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.welcome.register}    ${LONG_WAIT}    Register is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.welcome.register}
    AppiumLibrary.Wait Until Element Is Visible    ${android.textbox.registration.username}    ${LONG_WAIT}    Username textbox is not displayed after waiting ${LONG_WAIT} seconds
    mobile_common.Input Text    ${android.textbox.registration.username}    ${Username}
    mobile_common.Input Text    ${android.textbox.registration.email}    ${Email}
    mobile_common.Input Text    ${android.textbox.registration.password}    ${Password}
    AppiumLibrary.Click Element    ${android.radio.registration.terms_conditions}
    AppiumLibrary.Click Element    ${android.button.welcome.register}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.welcome.login}    ${LONG_WAIT}    Login textbox is not displayed after waiting ${LONG_WAIT} seconds

Validate new user is created
    [Arguments]    ${email}    ${password}
    Enter WeShop login details    ${email}    ${password}
    AppiumLibrary.Click Element    ${android.button.home.logout}
    CustomLibrary.Wait Until Time    2
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.welcome.login}    ${LONG_WAIT}    Login button is not displayed after waiting ${LONG_WAIT} seconds

Enter WeShop login details
    [Arguments]    ${email}    ${password}
    AppiumLibrary.Wait Until Element Is Visible    ${android.textbox.registration.email}    ${LONG_WAIT}    Email textbox is not displayed after waiting ${LONG_WAIT} seconds
    mobile_common.Input Text    ${android.textbox.registration.email}    ${email}
    mobile_common.Input Text    ${android.textbox.registration.password}    ${password}
    AppiumLibrary.Click Element    ${android.button.welcome.login}
    CustomLibrary.Wait Until Time    3
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.home.logout}    ${LONG_WAIT}    Logout button is not displayed after waiting ${LONG_WAIT} seconds
