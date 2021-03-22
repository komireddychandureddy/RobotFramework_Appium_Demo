*** Settings ***
Library           AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library           FakerLibrary
Library           String
Library           Collections
Library           Screenshot
Library           DateTime
Library           ../Library/CustomLibrary.py
Library           ../Library/AppiumExtendedLibrary.py
Resource          common_variables.robot
Resource          android_variables.robot
Resource          Remote/android_variables.robot
Resource          Remote/common_variables.robot
Resource          ../ObjectRepository/Android/buttons.robot
Resource          ../ObjectRepository/Android/images.robot
Resource          ../ObjectRepository/Android/radiobuttons.robot
Resource          ../ObjectRepository/Android/spinners.robot
Resource          ../ObjectRepository/Android/textboxes.robot
Resource          ../Keywords/Android/android_common.robot
Resource          ../Keywords/Android/profile.robot
Resource          ../Keywords/Android/orders.robot
Resource          ../Keywords/mobile_common.robot
