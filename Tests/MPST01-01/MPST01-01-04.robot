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
MPST01_01_Catogory_ECC_3

    Open Money Plus

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Self}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n100.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Wife}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n50.0 %\nNT$900
    Element Attribute Should Match    ${Member-Wife}     content-desc    老婆\n50.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Husband}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n33.3 %\nNT$900
    Element Attribute Should Match    ${Member-Wife}     content-desc    老婆\n33.3 %\nNT$900
    Element Attribute Should Match    ${Member-Husband}     content-desc    老公\n33.3 %\nNT$900

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Child}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n25.0 %\nNT$900
    Element Attribute Should Match    ${Member-Wife}     content-desc    老婆\n25.0 %\nNT$900
    Element Attribute Should Match    ${Member-Husband}     content-desc    老公\n25.0 %\nNT$900
    Element Attribute Should Match    ${Member-Child}      content-desc    子女\n25.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Parent}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n20.0 %\nNT$900
    Element Attribute Should Match    ${Member-Wife}     content-desc    老婆\n20.0 %\nNT$900
    Element Attribute Should Match    ${Member-Husband}     content-desc    老公\n20.0 %\nNT$900
    Element Attribute Should Match    ${Member-Child}      content-desc    子女\n20.0 %\nNT$900
    Element Attribute Should Match    ${Member-Parent}      content-desc    父母\n20.0 %\nNT$900

    Add New Expense For 900 Dollars By Different Member     Member=${Member-Family}

    Click    ${PICTURE-ICON}
    Wait Until Page Contains Element  ${Catogory-Diet}
    Change To Member Expense Page
    Wait Until Element Is Visible    ${Member-Self}
    Element Attribute Should Match    ${Member-Self}     content-desc    自己\n16.7 %\nNT$900
    Element Attribute Should Match    ${Member-Wife}     content-desc    老婆\n16.7 %\nNT$900
    Element Attribute Should Match    ${Member-Husband}     content-desc    老公\n16.7 %\nNT$900
    Element Attribute Should Match    ${Member-Child}      content-desc    子女\n16.7 %\nNT$900
    Element Attribute Should Match    ${Member-Parent}      content-desc    父母\n16.7 %\nNT$900
    Element Attribute Should Match    ${Member-Family}      content-desc    家庭\n16.7 %\nNT$900