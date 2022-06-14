*** Settings ***
Documentation    刪除收支紀錄
Library  AppiumLibrary
Library  String
Resource    ../Variables.txt
Resource    ../Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus

*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${Item}   //android.widget.ImageView[contains(@content-desc,"默認帳戶")]
${ItemInfo}   //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[1]/..
${ItemInfoPageDelete}    //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[2]
${DeleteButton}    //android.widget.Button[@content-desc="確定"]
${EmptyMainPage}  //android.widget.ImageView[@content-desc="當期還沒有記帳哦！"]

*** Keywords ***
Add New Income For 900 Dollars By Price Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${IncomePageButtonInEdit}
    Click Element    ${IncomePageButtonInEdit}
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${PRICE-ICON}
    Click Element    ${CONFIRM}

Delete Item Information
    Click Element   ${ItemInfoPageDelete}
    Click Element   ${DeleteButton}

Click Expend
    Wait Until Element Is Visible    ${Item}
    Click Element    ${Item}

*** Test Cases ***
MPST01_08_HappyPath
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ItemInfo}
    Delete Item Information
    Wait Until Element Is Visible    ${EmptyMainPage}