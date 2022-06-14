*** Settings ***
Documentation    管理帳本
Library  AppiumLibrary
Resource    ./../Variables.txt
Resource    ./../Keywords.txt

*** Variables ***
${settingButton}    //android.widget.ImageView[@content-desc="設置\n第 4 個標籤，總共 4 個"]
${settingPage}    //android.view.View[@content-desc="設置"]
${ledgerButton}    //android.widget.ImageView[@content-desc="帳本管理"]
${ledgerPage}    //android.view.View[@content-desc="帳本管理"]
${addLedger}    //android.view.View[@content-desc="+新增"]
${addLedgerPage}    //android.view.View[@content-desc="添加帳本"]
${ledgerNameInput}    //android.view.View[@content-desc="圖標"]/preceding-sibling::android.widget.ImageView
${addLedgerDoneButton}    //android.view.View[@content-desc="添加帳本"]/following-sibling::android.widget.Button
${newLedger}    //android.widget.ImageView[@content-desc="test"]
${iconButton}    //android.view.View[@content-desc="圖標"]/child::android.widget.ImageView[2]
${chooseIcon}    //android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.ImageView[8]
# ${chooseIcon}    //android.widget.Button[@content-desc="返回"]/../following-sibling::android.view.View/child::android.widget.ImageView[8]

*** Keywords ***
Open Money Plus
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=com.zotiger.accountbook    appActivity=com.zotiger.accountbook.MainActivity    automationName=Uiautomator2
    Wait Until Element Is Visible    ${EDIT-ICON}

Add New Ledger
    Click Element    ${settingButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${ledgerButton}
    Wait Until Element Is Visible    ${ledgerPage}
    Click Element    ${addLedger}
    Wait Until Element Is Visible    ${addLedgerPage}
    Click Element    ${ledgerNameInput}
    Sleep    3
    Press Keycode    48
    Press Keycode    33
    Press Keycode    47
    Press Keycode    48
    Press Keycode    66
    Click Element    ${iconButton}
    Sleep    3
    Click Element   ${chooseIcon}
    Wait Until Element Is Visible    ${addLedgerPage}
    Click Element    ${addLedgerDoneButton}
    Page Should Contain Element    ${newLedger}

*** Test Cases ***
MPST01_17
    Open Money Plus
    Add New Ledger