*** Settings ***
Documentation    檢視收支紀錄
Library  AppiumLibrary
Library  String
Resource    ../Variables.txt
Resource    ../Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus

*** Variables ***
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"默認帳戶")]
${ChildItemInfo}   //android.view.View[@index=0]/android.widget.ImageView[contains(@content-desc,"默認帳本")]/android.widget.Button[1]/..

*** Keywords ***
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


Add New Income For 900 Dollars By Price Catogory And ChildMember Using *
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${BOTTON9}
    Click    ${ButtonMutiply}
    Click    ${BOTTON1}
    Click    ${BOTTON0}
    Click    ${BOTTON0}
    Click    ${PRICE-ICON}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For 900 Dollars By Price Catogory By ChildMember Using +
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${BOTTON5}
    Click    ${BOTTON0}
    Click    ${BOTTON0}
    Click    ${ButtonAdd}
    Click    ${BOTTON4}
    Click    ${BOTTON0}
    Click    ${BOTTON0}
    Click    ${PRICE-ICON}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For Defualt Dollars By Defualt Catogory And Defualt Member And Not Using Operator
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${CONFIRM}

Add New Income For Zero Dollars By Price Catogory And ChildMember Using +
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${PRICE-ICON}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${BOTTON0}
    Click    ${ButtonAdd}
    Click    ${BOTTON0}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For Negative Dollars By Price Catogory And ChildMember Using -
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${PRICE-ICON}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${ButtonSub}
    Click    ${BOTTON5}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For 12.5 Float Dollars By Price Catogory And ChildMember Using /
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${PRICE-ICON}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${BOTTON5}
    Click    ${BOTTON0}
    Click    ${ButtonDivision}
    Click    ${BOTTON4}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For -0.5 Negative Float Dollars By Default Catogory And ChildMember
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${ButtonSub}
    Click    ${BOTTON0}
    Click    ${BOTTONDot}
    Click    ${BOTTON5}
    Click    ${EQUAL}
    Click    ${CONFIRM}

Add New Income For Zero Float Dollars By Default Catogory And ChildMember
    Click    ${EDIT-ICON}
    Click    ${IncomePageButtonInEdit}
    Click    ${ChangeMember}
    Click    ${ChildMember}
    Click    ${BOTTON0}
    Click    ${BOTTONDot}
    Click    ${BOTTON0}
    Click    ${CONFIRM}

Click Expend
    Wait Until Page Contains Element    ${ChildItem}
    Wait Until Element Is Visible    ${ChildItem}
    Click Element    ${ChildItem}

Delete Income In Expand
    Click   //android.widget.ImageView[contains(@content-desc,"默認帳戶")]/android.widget.Button[2]
    Click   //android.widget.Button[@content-desc="確定"]

*** Test Cases ***
MPST01_09_HappyPath
    [tags]    Happy_Path
    Add New Income For Defualt Dollars By Defualt Catogory And Defualt Member And Not Using Operator
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "工資 +NT$0" in "${info}"
    Should Be True    "成員: 自己" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For Zero Dollars By Price Catogory And ChildMember Using +
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "獎金 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For Negative Dollars By Price Catogory And ChildMember Using -
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "獎金 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For 900 Dollars By Price Catogory And ChildMember Using *
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "獎金 +NT$900" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For 12.5 Float Dollars By Price Catogory And ChildMember Using /
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "獎金 +NT$12.50" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For -0.5 Negative Float Dollars By Default Catogory And ChildMember
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "工資 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

    Add New Income For Zero Float Dollars By Default Catogory And ChildMember
    Click Expend
    Wait Until Page Contains Element    ${ChildItemInfo}
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}
    Should Be True    "工資 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"
    Delete Income In Expand

MPST01_09_With_Long_Number
    [tags]    Long_Number
    Add New Income For Twenty Digits By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "獎金 +NT$999,999,999,999" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"

MPST01_09_With_Negative_Float_Number
    [tags]    Negative_Number
    Add New Income For Negative Float Dollars By Price Catogory By ChildMember
    Click Expend
    Wait Until Element Is Visible    ${ChildItemInfo}
    ${info} =  Get Element Attribute  ${ChildItemInfo}  content-desc
    ${info} =  Replace String	${info}  \n  ${space}  
    Should Be True    "獎金 +NT$0" in "${info}"
    Should Be True    "成員: 子女" in "${info}"
    Should Be True    "帳戶: 默認帳戶" in "${info}"
    Should Be True    "帳本: 默認帳本" in "${info}"