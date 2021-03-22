*** Variables ***
${ANDROID_APP}    ${EXECDIR}/Apps/weShop.apk
${WESHOP_EMAIL}    chandu@mailinator.com
${WESHOP_PASSWORD}    Test@1234
${ANDROID_LONG_WAIT}    60s
${ANDROID_PLATFORM_VERSION}    10    # depends on the OS you use. Currently for iOS: 13.3 and for Androsi its 10
${ANDROID_DEVICE_NAME}    emulator5554    # args can be : <Device id for android> or iPhone for iOS
${PLATFORM_NAME}    Android    # Args can be : Android or iOS
${ANDROID_AUTOMATION_NAME}    UIAutomator2    # args can be: UIAutomator2 for android for XCUITest for iOS
${APPIUM_SERVER_URL}    http://localhost:4723/wd/hub
${ANDROID_NO_RESET_APP}    False
${NEW_COMMAND_TIMEOUT}    120