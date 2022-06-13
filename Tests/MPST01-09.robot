*** Settings ***
Documentation    檢視收支紀錄
Library  AppiumLibrary
Resource    ./Variables.txt
Resource    ./Keywords.txt
*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"子女")]
${ChildItemInfo}   //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]

*** Keywords ***

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

Click Expend
    Wait Until Element Is Visible    ${ChildItem}
    Click Element    ${ChildItem}


*** Test Cases ***
MPST01_02
    Open Money Plus
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    # Element Should Contain Text    ${ChildItemInfo}    獎金 +NT$900
    # Element Should Contain Text    ${ChildItemInfo}    成員: 子女
    # Element Should Contain Text    ${ChildItemInfo}    帳戶: 默認帳戶
    # Element Should Contain Text    ${ChildItemInfo}    帳本: 默認帳本