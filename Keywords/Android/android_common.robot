*** Settings ***
Resource          ../../Config/super.robot

*** Keywords ***
Logout from Application
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.home.logout}    ${LONG_WAIT}    Logout button is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.home.logout}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.welcome.register}    ${LONG_WAIT}    Register button is not displayed after waiting ${LONG_WAIT} seconds

Login to Mobile Application
    [Arguments]    ${Email}    ${Password}
    Launch Mobile Application    Android    ${REMOTE_MOBILE_EXECUTION}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.welcome.login}    ${LONG_WAIT}    Login is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.welcome.login}
    Enter WeShop login details    ${Email}    ${Password}
