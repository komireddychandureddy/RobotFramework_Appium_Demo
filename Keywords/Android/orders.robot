*** Settings ***
Resource          ../../Config/super.robot

*** Keywords ***
Place an Order
    [Arguments]    ${category}
    AppiumLibrary.Wait Until Element Is Visible    ${android.images.home.more_options}    ${LONG_WAIT}    More Options is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.images.home.more_options}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.TextView[@text='${category}']    ${LONG_WAIT}    ${category} is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    //android.widget.TextView[@text='${category}']
    AppiumLibrary.Wait Until Element Is Visible    ${android.images.home.cart}    ${LONG_WAIT}    Cart is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.images.home.cart}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.order.place_order}    ${LONG_WAIT}    Place Order button is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.order.place_order}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.common.yes}    ${LONG_WAIT}    Yes button is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.common.yes}

Enter Payment Details
    [Arguments]    ${card_details}
    Add Card Details    ${card_details}[Email]    ${card_details}[Card Number]    ${card_details}[CVV]    ${card_details}[Card Name]    ${card_details}[Month]    ${card_details}[Year]

Validate Order is Placed
    CustomLibrary.Wait Until Time    3
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.home.logout}    ${LONG_WAIT}    Payment was not successfull

Add Card Details
    [Arguments]    ${email}    ${card_number}    ${cvv}    ${card_name}    ${month}    ${year}
    AppiumLibrary.Wait Until Element Is Visible    ${android.textbox.card.email}    ${LONG_WAIT}    Email textbox is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    visaOption
    mobile_common.Input Text    ${android.textbox.card.email}    ${email}
    mobile_common.Input Text    ${android.textbox.card.card_number}    ${card_number}
    mobile_common.Input Text    ${android.textbox.card.CVV}    ${cvv}
    mobile_common.Input Text    ${android.textbox.card.card_name}    ${card_name}
    Select Month    ${month}
    Select Year    ${year}
    AppiumLibrary.Wait Until Element Is Visible    ${android.button.card.payment}    ${LONG_WAIT}    Payment button is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.button.card.payment}

Select Year
    [Arguments]    ${year}
    AppiumLibrary.Wait Until Element Is Visible    ${android.spinner.card.year}    ${LONG_WAIT}    Year spinner is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.spinner.card.year}
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.CheckedTextView[contains(@text,'${year}')]    ${LONG_WAIT}    ${year} is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    //android.widget.CheckedTextView[contains(@text,'${year}')]

Select Month
    [Arguments]    ${month}
    AppiumLibrary.Wait Until Element Is Visible    ${android.spinner.card.month}    ${LONG_WAIT}    Month spinner is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    ${android.spinner.card.month}
    AppiumExtendedLibrary.Swipe Down To Element    //android.widget.CheckedTextView[contains(@text,'${month}')]    3
    AppiumLibrary.Wait Until Element Is Visible    //android.widget.CheckedTextView[contains(@text,'${month}')]    ${LONG_WAIT}    ${month} is not displayed after waiting ${LONG_WAIT} seconds
    AppiumLibrary.Click Element    //android.widget.CheckedTextView[contains(@text,'${month}')]
