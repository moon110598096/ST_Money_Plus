*** Settings ***
Documentation    分析收入
Library  AppiumLibrary
Resource    ../Variables.txt
Resource    ../Keywords.txt
*** Variables ***
${PICTURE-ICON}    //android.widget.ImageView[contains(@content-desc,'圖表分析')]
${IncomePageButtonInEdit}       //android.view.View[@content-desc="收入"]/android.widget.ImageView[2]
${IncomePageButtonInPictureAnalize}       //android.view.View[@content-desc="收入分析"]
${Commute-Catogory-ICON}    //android.widget.ImageView[@content-desc="交通"]
${WageItemInCatogoryIncomeOfPictrueAnalize}   //android.widget.ImageView[contains(@content-desc,'工資')]
${PriceItemInCatogoryIncomeOfPictrueAnalize}   //android.widget.ImageView[contains(@content-desc,'獎金')]
${AccountIncomePage}    //android.widget.Button[@content-desc="帳戶收入"]
${MemberIncomePage}    //android.widget.Button[@content-desc="成員收入"]
${DefaultAccountItem}   //android.widget.ImageView[contains(@content-desc,"默認帳戶")]
${MyselfItem}   //android.widget.ImageView[contains(@content-desc,"自己")]
${ChildItem}   //android.widget.ImageView[contains(@content-desc,"子女")]

*** Keywords ***
Add New Income For 900 Dollars
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
    Click Element    ${CONFIRM}
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
    Click Element    ${CONFIRM}
    Click Element    ${CONFIRM}

Change To Account Income Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${AccountIncomePage}
    Click Element    ${AccountIncomePage}

Change To Member Income Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${MemberIncomePage}
    Click Element    ${MemberIncomePage}
*** Test Cases ***
MPST01_02
    Open Money Plus
    Add New Income For 900 Dollars
    Add New Income For 900 Dollars By Price Catogory By ChildMember
    Click Element    ${PICTURE-ICON}
    Wait Until Element Is Visible       ${IncomePageButtonInPictureAnalize}
    Click Element    ${IncomePageButtonInPictureAnalize}
    Wait Until Element Is Visible  ${WageItemInCatogoryIncomeOfPictrueAnalize}
    Element Attribute Should Match    ${WageItemInCatogoryIncomeOfPictrueAnalize}     content-desc    工資\n50.0 %\nNT$900
    Element Attribute Should Match    ${PriceItemInCatogoryIncomeOfPictrueAnalize}     content-desc    獎金\n50.0 %\nNT$900

    Change To Account Income Page
    Wait Until Element Is Visible    ${DefaultAccountItem}
    Element Attribute Should Match    ${DefaultAccountItem}     content-desc    默認帳戶\n100.0 %\nNT$1,800

    Change To Member Income Page
    Wait Until Element Is Visible    ${MyselfItem}
    Element Attribute Should Match    ${MyselfItem}     content-desc    自己\n50.0 %\nNT$900
    Element Attribute Should Match    ${ChildItem}     content-desc    子女\n50.0 %\nNT$900
