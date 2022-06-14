*** Settings ***
Documentation    分析支出
Library  AppiumLibrary
Resource    ../Variables.txt
Resource    ../Keywords.txt
*** Variables ***
${PICTURE-ICON}    //android.widget.ImageView[contains(@content-desc,"圖表分析")]
${ChildItem}        //android.widget.ImageView[contains(@content-desc,"子女")]




*** Keywords ***

Enter 900 Dollars
    Wait Until Element Is Visible    ${BOTTON9}
    Click Element    ${BOTTON9}
    Wait Until Element Is Visible    ${BOTTON0}
    Click Element    ${BOTTON0}
    Wait Until Element Is Visible    ${BOTTON0}
    Click Element    ${BOTTON0}
    Wait Until Element Is Visible    ${CONFIRM}
    Click Element    ${CONFIRM}

Add New Expense For 900 Dollars By Different Catogory
    [Arguments]    ${Catogory}

    Wait Until Element Is Visible    ${ACCOUNT-ICON}
    Click Element    ${ACCOUNT-ICON}
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}

    Wait Until Element Is Visible    ${Catogory}
    Click Element    ${Catogory}
    Enter 900 Dollars

Add New Expense For 900 Dollars By Different Member
    [Arguments]    ${Member}

    Wait Until Element Is Visible    ${ACCOUNT-ICON}
    Click Element    ${ACCOUNT-ICON}
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}

    Wait Until Element Is Visible    ${ChangeMember}
    Click Element    ${ChangeMember}

    Wait Until Element Is Visible    ${Member}
    Click Element    ${Member}
    Enter 900 Dollars



Change To Account Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${AccountExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${AccountExpenseInDelayMenuOfPictrueAnalize}

Change To Member Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${MemberExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${MemberExpenseInDelayMenuOfPictrueAnalize}

Delete
    [Arguments]    ${Catogory}
    Click   ${Catogory}
    Click   ${Catogory}/android.widget.Button[2]
    Click   ${DateConfirm}

*** Test Cases ***

MPST01_01_Catogory_ECC_1
    Open Money Plus

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Diet}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n100.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Daily-Use}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n50.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Daily-Use}    content-desc    日用\n50.0 %\nNT$900



    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Transportation}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n33.3 %\nNT$900
    Element Attribute Should Match    ${Catogory-Daily-Use}    content-desc    日用\n33.3 %\nNT$900
    Element Attribute Should Match    ${Catogory-Transportation}    content-desc    交通\n33.3 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Social-Contact}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Daily-Use}    content-desc    日用\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Transportation}    content-desc    交通\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Social-Contact}    content-desc    社交\n25.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-House}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Daily-Use}    content-desc    日用\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Transportation}    content-desc    交通\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Social-Contact}    content-desc    社交\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-House}    content-desc    住房物業\n20.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Present}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Element Attribute Should Match    ${Catogory-Diet}    content-desc    飲食\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Daily-Use}    content-desc    日用\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Transportation}    content-desc    交通\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Social-Contact}    content-desc    社交\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-House}    content-desc    住房物業\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Present}    content-desc    禮物\n16.7 %\nNT$900
