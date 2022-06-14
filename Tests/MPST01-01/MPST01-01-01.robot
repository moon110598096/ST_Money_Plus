*** Settings ***
Documentation    分析支出
Library  AppiumLibrary
Resource    ../Variables.txt
Resource    ../Keywords.txt
*** Variables ***
${PICTURE-ICON}    //android.widget.ImageView[contains(@content-desc,"圖表分析")]
${ChildItem}        //android.widget.ImageView[contains(@content-desc,"子女")]




*** Keywords ***
Add New Expense For 900 Dollars
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${ButtonMutiply}
    Click Element    ${BOTTON1}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${CONFIRM}
    Click Element    ${CONFIRM}

Add New Expense For 900 Dollars By Daily Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${ButtonMutiply}
    Click Element    ${BOTTON1}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${Daily-Use-ICON}
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ChildMember}
    Click Element    ${ChildMember}
    Wait Until Element Is Visible    ${CONFIRM}
    Click Element    ${CONFIRM}
    Click Element    ${CONFIRM}

Change To Account Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${AccountExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${AccountExpenseInDelayMenuOfPictrueAnalize}

Change To Member Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${MemberExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${MemberExpenseInDelayMenuOfPictrueAnalize}

*** Test Cases ***
MPST01_01
    #Happy path
    Open Money Plus
    Add New Expense For 900 Dollars
    Add New Expense For 900 Dollars By Daily Catogory By ChildMember
    Click Element    ${PICTURE-ICON}
    Wait Until Element Is Visible  ${EatingItemInCatogoryExpenseOfPictrueAnalize}
    Element Attribute Should Match    ${EatingItemInCatogoryExpenseOfPictrueAnalize}    content-desc    飲食\n50.0 %\nNT$900
    Element Attribute Should Match    ${DailyItemInCatogoryExpenseOfPictrueAnalize}     content-desc    日用\n50.0 %\nNT$900

    Change To Account Expense Page
    Wait Until Element Is Visible    ${DefaultAccountItemINAccountExpenseOfPictrueAnalize}
    Element Attribute Should Match    ${DefaultAccountItemINAccountExpenseOfPictrueAnalize}     content-desc    默認帳戶\n100.0 %\nNT$1,800

    Change To Member Expense Page
    Wait Until Element Is Visible    ${MyselfInAccountExpenseOfPictrueAnalize}
    Element Attribute Should Match    ${MyselfInAccountExpenseOfPictrueAnalize}     content-desc    自己\n50.0 %\nNT$900
    Element Attribute Should Match    ${ChildItem}     content-desc    子女\n50.0 %\nNT$900

#TEST
#    Open Money Plus
#    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Diet}
#    Delete    ${Catogory-Diet}
