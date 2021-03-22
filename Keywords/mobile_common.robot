*** Settings ***
Resource          ../Config/super.robot

*** Keywords ***
Launch Mobile Application
    [Arguments]    ${platform_name}    ${remote_execution}=No
    Run Keyword If    '${remote_execution}'=='Yes'    Log    Launching Application in Browserstack with ${REMOTE_APPIUM_SERVER_URL}
    ...    ELSE    Log    Launching Mobile application in Local setup
    Run Keyword If    '${platform_name}'=='Android' and '${remote_execution}'=='No'    AppiumLibrary.Open Application    ${APPIUM_SERVER_URL}    platformName=Android    platformVersion=${ANDROID_PLATFORM_VERSION}    deviceName=${ANDROID_DEVICE_NAME}    app=${ANDROID_APP}    automationName=${ANDROID_AUTOMATION_NAME}    noReset=${ANDROID_NO_RESET_APP}    autoAcceptAlerts=True    autoGrantPermissions=True
    Run Keyword If    '${platform_name}'=='iOS' and '${remote_execution}'=='No'    AppiumLibrary.Open Application    ${APPIUM_SERVER_URL}    platformName=iOS    platformVersion=${IOS_PLATFORM_VERSION}    deviceName=${IOS_DEVICE_NAME}    app=${IOS_APP}    udid=${UDID}    bundleId=${BUNDLE_ID}    automationName=${IOS_AUTOMATION_NAME}    noReset=${IOS_NO_RESET_APP}    autoAcceptAlerts=True
    Run Keyword If    '${platform_name}'=='Android' and '${remote_execution}'=='Yes'    AppiumLibrary.Open Application    remote_url=${REMOTE_APPIUM_SERVER_URL}    browserstack.user=${USER}    browserstack.key=${KEY}    device=${REMOTE_ANDROID_DEVICE_NAME}    os_version=${REMOTE_ANDROID_PLATFORM_VERSION}    app=${REMOTE_ANDROID_APP}    project=Demo Project    build=1.0    name=${TEST_NAME}
    Run Keyword If    '${platform_name}'=='iOS' and '${remote_execution}'=='Yes'    AppiumLibrary.Open Application    remote_url=${REMOTE_APPIUM_SERVER_URL}    browserstack.user=${USER}    browserstack.key=${KEY}    device=${REMOTE_IOS_DEVICE_NAME}    os_version=${REMOTE_IOS_PLATFORM_VERSION}    app=${REMOTE_IOS_APP}    project=Demo Project    build=1.0    name=${TEST_NAME}
    Run Keyword If    '${platform_name}'!='iOS' and '${platform_name}'!='Android'    Fail    Platform Name used '${platform_name}'. Please provide valid Platform Name.
    Set Appium Timeout    15s

Input Text
    [Arguments]    ${locator}    ${data}
    AppiumLibrary.Input Text    ${locator}    ${data}
    AppiumLibrary.Hide Keyboard

Read TestData From Excel
    [Arguments]    ${testcaseid}
    ${test_prerequisite_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${TESTDATA_FOLDER}\\TestData.xlsx    ${testcaseid}    Android
    Set Global Variable    ${test_prerequisite_data}
    ${TEST_NAME}    Set Variable    ${testcaseid}
    Set Global Variable    ${TEST_NAME}

Generate Random Email
    ${random_number}    FakerLibrary.Random Number    9    True
    ${email}    Set Variable    Test_${random_number}@mailinator.com
    [Return]    ${email}
