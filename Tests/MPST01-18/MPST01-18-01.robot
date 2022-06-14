*** Settings ***
Documentation    刪除收支紀錄
Library  AppiumLibrary
Library  String
Resource    ../Variables.txt
Resource    ../Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus

*** Variables ***
${MainPageSettingButton}  	//android.widget.ImageView[contains(@content-desc,'設置')]
${ManagerAccountButton}    //android.widget.ImageView[@content-desc="帳戶管理"]
${AddAccount}    //android.view.View[@content-desc="+新增"]
${CashAccount}    //android.widget.ImageView[@content-desc="現金"]
${BankAccount}    //android.widget.ImageView[@content-desc="銀行帳戶"]
${CreditCardAccount}    //android.widget.ImageView[@content-desc="信用卡"]
${VirtualAccount}    //android.widget.ImageView[@content-desc="虛擬帳戶"]
${AccountName}    //android.view.View[@content-desc="帳戶信息\n現金"]/following-sibling::android.widget.ImageView[1]
${Balance}    //android.view.View[@content-desc="帳戶信息\n現金"]/following-sibling::android.widget.ImageView[2]
${SaveAccount}    //android.view.View[@content-desc="添加 現金"]/following-sibling::android.widget.Button[1]
${NewAccount}    //android.widget.ImageView[@content-desc="test"]
${EditAccount}    //android.widget.ImageView[@content-desc="ooottest"]
${EditSave}    //android.view.View[@content-desc="編輯帳戶"]/following-sibling::android.widget.Button[2]
${DeleteAccount}    //android.view.View[@content-desc="編輯帳戶"]/following-sibling::android.widget.Button[1]
${CheckDelete}    //android.view.View[@content-desc="刪除"]
${DoubleCheckDelete}    //android.widget.Button[@content-desc="確定"]

*** Keywords ***
Add New Account
    Wait Until Element Is Visible    ${MainPageSettingButton}
    Click Element    ${MainPageSettingButton}
    Wait Until Element Is Visible    ${ManagerAccountButton}
    Click Element    ${ManagerAccountButton}
    Wait Until Element Is Visible    ${AddAccount}
    Click Element    ${AddAccount}
    Wait Until Element Is Visible    ${CashAccount}
    Click Element    ${CashAccount}
    Wait Until Element Is Visible    ${AccountName}
    Click Element    ${AccountName}
    Press Keycode    48
    Press Keycode    33
    Press Keycode    47
    Press Keycode    48
    Wait Until Element Is Visible    ${Balance}
    Click Element    ${Balance}
    Press Keycode    149
    Press Keycode    144
    Press Keycode    144
    Wait Until Element Is Visible    ${SaveAccount}
    Click Element    ${SaveAccount}
    Wait Until Element Is Visible    ${NewAccount}
    ${info} =  Get Element Attribute  ${NewAccount}  content-desc
    Should Be True    "test" in "${info}"

Edit Account
    Wait Until Element Is Visible    ${NewAccount}
    Click Element    ${NewAccount}
    Click Element    ${AccountName}
    Press Keycode    43
    Press Keycode    43
    Press Keycode    43
    Press Keycode    48
    Click Element    ${EditSave}
    Wait Until Element Is Visible    ${EditAccount}
    ${info} =  Get Element Attribute  ${EditAccount}  content-desc
    Should Be True    "ooottest" in "${info}"

Delete Account
    Wait Until Element Is Visible    ${EditAccount}
    Click Element    ${EditAccount}
    Wait Until Element Is Visible    ${DeleteAccount}
    Click Element    ${DeleteAccount}
    Wait Until Element Is Visible    ${CheckDelete}
    Click Element    ${CheckDelete}
    Wait Until Element Is Visible    ${DoubleCheckDelete}
    Click Element    ${DoubleCheckDelete}
    Wait Until Element Is Visible    ${ManagerAccountButton}
    Click Element    ${ManagerAccountButton}
    
*** Test Cases ***
MPST01_18_HappyPath
    Add New Account
    Edit Account
    Delete Account