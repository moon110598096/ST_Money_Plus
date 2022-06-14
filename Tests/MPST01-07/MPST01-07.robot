*** Settings ***
Documentation    修改收支紀錄
Library  AppiumLibrary
Library  String
Resource    ../Variables.txt
Resource    ../Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus

*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"子女")]
${ParentItem}   //android.widget.ImageView[contains(@content-desc,"父母")]
${ItemInfo}   //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[1]/..
${ItemInfoPageEdit}    //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[3]

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
    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

Edit Item Information
    Click Element   ${ItemInfoPageEdit}
    Click Element   ${PART-TIME-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ParentMember}
    Click Element    ${ParentMember}
    Click Element    ${ButtonAdd}
    Click Element    ${BOTTON5}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

Edit Item Information With Negative Number
    Click Element   ${ItemInfoPageEdit}
    Click Element   ${PART-TIME-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ParentMember}
    Click Element    ${ParentMember}
    Click Element    ${ButtonSub}
    Click Element    ${BOTTON9}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

Edit Item Information With Long Number
    Click Element   ${ItemInfoPageEdit}
    Click Element   ${PART-TIME-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ParentMember}
    Click Element    ${ParentMember}
    Click Element    ${ButtonAdd}
        
    FOR    ${i}    IN RANGE    12
        Click Element    ${BOTTON9}
    END

    Click Element    ${EQUAL}
    Click Element    ${CONFIRM}

Click Expend
    Wait Until Element Is Visible    ${ChildItem}
    Click Element    ${ChildItem}

*** Test Cases ***
MPST01_07_HappyPath
    [Tags]  HappyPath
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ItemInfo}
    Edit Item Information

    Wait Until Element Is Visible    ${ParentItem}
    Click Element    ${ParentItem}

    ${info} =  Get Element Attribute  ${ItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "兼職 +NT$1,400" in "${info}"
    Should Be True    "成員: 父母" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"

MPST01_07_Negative_Number
    [Tags]  Negative_Number
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ItemInfo}
    Edit Item Information With Negative Number

    Wait Until Element Is Visible    ${ParentItem}
    Click Element    ${ParentItem}

    ${info} =  Get Element Attribute  ${ItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "兼職 +NT$0" in "${info}"
    Should Be True    "成員: 父母" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"

MPST01_07_Long_Number
    [Tags]  Long_Number
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ItemInfo}
    Edit Item Information With Long Number

    Wait Until Element Is Visible    ${ParentItem}
    Click Element    ${ParentItem}

    ${info} =  Get Element Attribute  ${ItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "兼職 +NT$999,999,999,999" in "${info}"
    Should Be True    "成員: 父母" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"