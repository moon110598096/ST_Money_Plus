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
MPST01_01_Catogory_ECC_2

    Open Money Plus

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Communication}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n100.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Clothes}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n50.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Clothes}    content-desc    服飾\n50.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Entertainment}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n33.3 %\nNT$900
    Element Attribute Should Match    ${Catogory-Clothes}    content-desc    服飾\n33.3 %\nNT$900
    Element Attribute Should Match    ${Catogory-Entertainment}    content-desc    娛樂\n33.3 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Cosmetic}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Clothes}    content-desc    服飾\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Entertainment}    content-desc    娛樂\n25.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Cosmetic}    content-desc    美容\n25.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Medical}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Clothes}    content-desc    服飾\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Entertainment}    content-desc    娛樂\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Cosmetic}    content-desc    美容\n20.0 %\nNT$900
    Element Attribute Should Match    ${Catogory-Medical}    content-desc    醫療\n20.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Catogory     Catogory=${Catogory-Tax}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Communication}
    Element Attribute Should Match    ${Catogory-Communication}    content-desc    通信\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Clothes}    content-desc    服飾\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Entertainment}    content-desc    娛樂\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Cosmetic}    content-desc    美容\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Medical}    content-desc    醫療\n16.7 %\nNT$900
    Element Attribute Should Match    ${Catogory-Tax}    content-desc    稅金\n16.7 %\nNT$900
