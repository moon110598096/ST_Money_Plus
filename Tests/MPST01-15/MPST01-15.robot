*** Settings ***
Documentation    管理週期記帳
Library  AppiumLibrary
Resource    ../Variables.txt

*** Variables ***
${settingButton}    //android.widget.ImageView[@content-desc="設置\n第 4 個標籤，總共 4 個"]
${settingPage}    //android.view.View[@content-desc="設置"]
${periodicBillingButton}    //android.widget.ImageView[@content-desc="週期記帳"]
${periodicBillingPage}    //android.view.View[@content-desc="週期記帳"]
${addPeriodicBilling}    //android.view.View[@content-desc="+新增"]
${periodicBillingTypePage}    //android.view.View[@content-desc="新增週期記帳類型"]
${periodicBillingType}    //android.widget.ImageView[@content-desc="固定收支\n固定或週期性收支項目"]
${addPeriodicBillingPage}    //android.view.View[@content-desc="創建週期記帳"]
${periodicBillingAmount}    //android.widget.ImageView[@content-desc="類別"]/preceding-sibling::android.widget.ImageView
${periodicBillingCatagory}    //android.widget.ImageView[@content-desc="類別"]
${catagoryPage}    //android.view.View[@content-desc="類別選擇"]
${chooseCatagory}    //android.widget.ImageView[@content-desc="禮物"]
${periodicBillingCycle}    //android.widget.ImageView[@content-desc="週期"]
${cyclePage}    //android.widget.Button[@content-desc="選擇週期\n (無限期)"]
${chooseCycle}    //android.view.View[@content-desc="週二"]
${chooseCycleDone}    //android.widget.Button[@content-desc="確定"]
${addPeriodicBillingDoneButton}    //android.view.View[@content-desc="創建週期記帳"]/following-sibling::android.widget.Button
${newPeriodicBilling}    //android.widget.ImageView[@content-desc="禮物\n每 週:週二 \n-NT$900\n默認帳戶/自己"]

*** Keywords ***
Open Money Plus
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=com.zotiger.accountbook    appActivity=com.zotiger.accountbook.MainActivity    automationName=Uiautomator2
    Wait Until Element Is Visible    ${EDIT-ICON}

Add New Periodic Billing
    Click Element    ${settingButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${periodicBillingButton}
    Wait Until Element Is Visible    ${periodicBillingPage}
    Click Element    ${addPeriodicBilling}
    Wait Until Element Is Visible    ${periodicBillingTypePage}
    Click Element    ${periodicBillingType}
    Wait Until Element Is Visible    ${addPeriodicBillingPage}
    Click Element    ${periodicBillingAmount}
    Press Keycode    16
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Click Element    ${periodicBillingCatagory}
    Wait Until Element Is Visible    ${catagoryPage}
    Click Element    ${chooseCatagory}
    Wait Until Element Is Visible    ${addPeriodicBillingPage}
    Click Element    ${periodicBillingCycle}
    Wait Until Element Is Visible    ${cyclePage}
    Click Element    ${chooseCycle}
    Click Element    ${chooseCycleDone}
    Wait Until Element Is Visible    ${addPeriodicBillingPage}
    Click Element    ${addPeriodicBillingDoneButton}
    Wait Until Element Is Visible    ${newPeriodicBilling}

*** Test Cases ***
MPST01_15
    Open Money Plus
    Add New Periodic Billing