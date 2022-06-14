*** Settings ***
Documentation    管理預算
Library  AppiumLibrary
Resource    ../Variables.txt

*** Variables ***
${settingButton}    //android.widget.ImageView[@content-desc="設置\n第 4 個標籤，總共 4 個"]
${settingPage}    //android.view.View[@content-desc="設置"]
${budgetButton}    //android.widget.ImageView[@content-desc="預算設定"]
${budgetPage}    //android.view.View[@content-desc="預算設定"]
${ledgerBudget}    //android.widget.ImageView[@content-desc="默認帳本\n未設定"]
${ledgerBudgetEdit}    //android.view.View[@content-desc="默認帳本"]
${addBudgetDone}    //android.widget.Button[@content-desc="確定"]
${dietBudget}    //android.widget.ImageView[@content-desc="飲食\n未設定"]
${dietBudgetEdit}    //android.view.View[@content-desc="飲食"]
${giftBudget}    //android.widget.ImageView[@content-desc="禮物\n未設定"]
${giftBudgetEdit}    //android.view.View[@content-desc="禮物"]
${returnButton}    //android.widget.Button[@content-desc="返回"]
${mainPageButton}    //android.widget.ImageView[@content-desc="記帳本\n第 1 個標籤，總共 4 個"]
${mainPage}    //android.view.View[@content-desc="帳單\n帳單"]
${mainPageBudget}    //android.view.View[@content-desc="月預算\nNT$900"]
${mainPageFailureBudget}    //android.view.View[@content-desc="月預算\nNT$9999999999999999999999999999999999999999"]
${analysisButton}    //android.widget.ImageView[@content-desc="圖表分析\n第 3 個標籤，總共 4 個"]
${analysisPage}    //android.view.View[@content-desc="圖表分析"]
${budgetTabButton}    //android.view.View[@content-desc="預算"]
${budgetTabPage}    //android.view.View[@content-desc="0%\n0 / 900"]
${dietBudgetInBudgetPage}    //android.widget.ImageView[@content-desc="飲食\n400\n0%\nNT$0\nNT$400"]
${giftBudgetInBudgetPage}    //android.widget.ImageView[@content-desc="禮物\n500\n0%\nNT$0\nNT$500"]

*** Keywords ***
Open Money Plus
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=com.zotiger.accountbook    appActivity=com.zotiger.accountbook.MainActivity    automationName=Uiautomator2
    Wait Until Element Is Visible    ${EDIT-ICON}

Add New Budget
    Click Element    ${settingButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${budgetButton}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${ledgerBudget}
    Wait Until Element Is Visible    ${ledgerBudgetEdit}
    Press Keycode    16
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Click Element    ${addBudgetDone}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${dietBudget}
    Wait Until Element Is Visible    ${dietBudgetEdit}
    Press Keycode    11
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Click Element    ${addBudgetDone}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${giftBudget}
    Wait Until Element Is Visible    ${giftBudgetEdit}
    Press Keycode    12
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Click Element    ${addBudgetDone}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${returnButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${mainPageButton}
    Wait Until Element Is Visible    ${mainPage}
    Page Should Contain Element    ${mainPageBudget}
    Click Element    ${analysisButton}
    Wait Until Element Is Visible    ${analysisPage}
    Click Element    ${budgetTabButton}
    Wait Until Element Is Visible    ${budgetTabPage}
    Page Should Contain Element    ${dietBudgetInBudgetPage}
    Page Should Contain Element    ${giftBudgetInBudgetPage}

Add New Budget Failure
    Click Element    ${settingButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${budgetButton}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${ledgerBudget}
    Wait Until Element Is Visible    ${ledgerBudgetEdit}
    FOR  ${Index}  IN RANGE  40
        Press Keycode    16
    END
    Click Element    ${addBudgetDone}
    Wait Until Element Is Visible    ${budgetPage}
    Click Element    ${returnButton}
    Wait Until Element Is Visible    ${settingPage}
    Click Element    ${mainPageButton}
    Wait Until Element Is Visible    ${mainPage}
    Page Should Contain Element    ${mainPageFailureBudget}
    Click Element    ${analysisButton}
*** Test Cases ***
MPST01_16
    Open Money Plus
    Add New Budget

MPST01_16_Failure
    [Tags]    Failure
    Open Money Plus
    Add New Budget Failure