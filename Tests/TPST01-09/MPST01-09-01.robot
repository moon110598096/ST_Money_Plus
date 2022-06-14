*** Settings ***
Documentation    檢視收支紀錄
Library  AppiumLibrary
Library  String
Resource    ./Variables.txt
Resource    ./Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus

*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"子女")]
${ChildItemInfo}   //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[1]/..

*** Keywords ***
Add New Income For Negative Float Dollars By Price Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${IncomePageButtonInEdit}
    Click Element    ${IncomePageButtonInEdit}
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTONDot}
    Click Element    ${BOTTON7}
    Click Element    ${ButtonSub}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTONDot}
    Click Element    ${BOTTON9}
    
    Click Element    ${PRICE-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ChildMember}
    Click Element    ${ChildMember}
    Wait Until Element Is Visible    ${CONFIRM}
    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

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
    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

Add New Income For Twenty Digits By Price Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${IncomePageButtonInEdit}
    Click Element    ${IncomePageButtonInEdit}
    Wait Until Element Is Visible    ${BOTTON9}
    
    FOR    ${i}    IN RANGE    20
        Click Element    ${BOTTON9}
    END

    Click Element    ${PRICE-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ChildMember}
    Click Element    ${ChildMember}
    Wait Until Element Is Visible    ${CONFIRM}
    Click Element    ${CONFIRM}

Click Expend
    Wait Until Element Is Visible    ${ChildItem}
    Click Element    ${ChildItem}


*** Test Cases ***
MPST01_09_HappyPath
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "獎金 +NT$900" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"

MPST01_09_With_Negative_Float_Number
    Add New Income For Negative Float Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "獎金 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"

MPST01_09_With_Long_Number
    Add New Income For Twenty Digits By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "獎金 +NT$999,999,999,999" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"