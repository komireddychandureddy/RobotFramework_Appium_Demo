*** Settings ***
Test Teardown     Close Application
Resource          ../../../Config/super.robot

*** Test Cases ***
TC_01 Register a new user 
    [Setup]    mobile_common.Read TestData From Excel    TC_01
    Comment    Launch android mobile Application
    Launch Mobile Application    Android    ${REMOTE_MOBILE_EXECUTION}
    Comment    Create a new user with username, email and password
    Create a new user    ${test_prerequisite_data}[Username]    ${test_prerequisite_data}[Email]    ${test_prerequisite_data}[Password]
    Comment    Validate user is created by login in to the account with new credentials
    Validate new user is created    ${test_prerequisite_data}[Email]    ${test_prerequisite_data}[Password]

TC_02 Validate user is able to place an order with Paypal
    [Setup]    mobile_common.Read TestData From Excel    TC_02
    Comment    Login to Mobile Application
    Login to Mobile Application    ${WESHOP_EMAIL}    ${WESHOP_PASSWORD}
    Comment    Place an order
    Place an Order    ${test_prerequisite_data}[Category]
    Comment     Fill up the payment details
    Enter Payment Details   ${test_prerequisite_data}
    Comment     Validate success message for validating the order   
    Validate Order is Placed
