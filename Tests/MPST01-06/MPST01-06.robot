*** Settings ***
Documentation    新增收支紀錄
Library  AppiumLibrary

Resource    ../Variables.txt
Resource    ../Keywords.txt
*** Variables ***

*** Keywords ***

Enter Add Income Page
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${INCOME-ICON}
    Click Element    ${INCOME-ICON}

Change Date to 0613
    Wait Until Element Is Visible    ${ChangeDate}
    Click Element    ${ChangeDate}
    Wait Until Element Is Visible    ${DATE0613}
    Click Element    ${DATE0613}
    Click Element    ${DateConfirm}

ChangeType
    Wait Until Element Is Visible    ${PRICE-ICON}
    Click Element    ${PRICE-ICON}

ChangeAccount
    Click Element    ${ChangeAccount}
    Wait Until Element Is Visible    ${DefaultAccount}
    Click Element    ${DefaultAccount}

ChangeMember
    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}
    Wait Until Element Is Visible    ${ChildMember}
    Click Element    ${ChildMember}

*** Test Cases ***
MPST01-06
    Open Money Plus

    Enter Add Income Page

    Change Date to 0613

    ChangeType

    ChangeAccount

    ChangeMember

    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Click Element    ${ButtonMutiply}
    Click Element    ${BOTTON1}
    Click Element    ${BOTTON0}
    Click Element    ${BOTTON0}
    Click Element    ${CONFIRM}
    Click Element    ${CONFIRM}
    Wait Until Element Is Visible    ${RESULT}
    Element Attribute Should Match    ${RESULT}    content-desc    獎金\n子女\n+NT$900\n默認帳戶
    Click Element    ${RESULT}
    Wait Until Element Is Visible    ${ResultInDetail}
    Element Attribute Should Match    ${ResultInDetail}    content-desc    ${ExpectedContentDescInRsultInDetal}

