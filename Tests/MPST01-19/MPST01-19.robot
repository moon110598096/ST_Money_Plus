*** Settings ***
Documentation    查詢帳單
Library  AppiumLibrary
Resource    ./../Variables.txt
Resource    ./../Keywords.txt

*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"子女")]
${ChildItemInfo}    //android.widget.ImageView[contains(@content-desc,"子女")]

${searchButton}    //android.view.View[@content-desc="默認帳本"]/preceding-sibling::android.widget.Button
${searchResult}    //android.widget.ImageView[@content-desc="獎金\n子女\n+NT$900\n默認帳本/默認帳戶"]
${failedSearchResult}    //android.view.View[@content-desc="沒有找到任何帳單哦！"]

*** Keywords ***
Open Money Plus
    Open Application    http://localhost:4723/wd/hub    platformName=Android	deviceName=emulator-5554    appPackage=com.zotiger.accountbook    appActivity=com.zotiger.accountbook.MainActivity    automationName=Uiautomator2
    Wait Until Element Is Visible    ${EDIT-ICON}

Add New Income For 900 Dollars By Price Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${IncomePageButtonInEdit}
    Click Element    ${IncomePageButtonInEdit}
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${ButtonMutiply}
    Click Element    ${BOTTON1}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${PRICE-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ChildMember}
    Click Element    ${ChildMember}
    Wait Until Element Is Visible    ${CONFIRM}
    Click Element    ${CONFIRM}
    Click Element    ${CONFIRM}

Search for income with correct keyword
    Wait Until Element Is Visible    ${searchButton}
    Click Element    ${searchButton}
    Sleep    3
    Press Keycode    16
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Sleep    3
    Page Should Contain Element    ${searchResult}

Search for income with incorrect keyword
    Wait Until Element Is Visible    ${searchButton}
    Click Element    ${searchButton}
    Sleep    3
    Press Keycode    13
    Press Keycode    7
    Press Keycode    7
    Press Keycode    66
    Sleep    3
    Page Should Contain Element    ${failedSearchResult}

*** Test Cases ***
MPST01_19_01
    Open Money Plus
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Search for income with correct keyword
    Close Money Plus

MPST01_19_02
    Open Money Plus
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Search for income with incorrect keyword
    Close Money Plus