*** Settings ***
Documentation    分析支出
Library  AppiumLibrary
Resource    ./Variables.txt
Resource    ./Keywords.txt
*** Variables ***
${PICTURE-ICON}    //android.widget.ImageView[contains(@content-desc,"圖表分析")]
${ChildItem}        //android.widget.ImageView[contains(@content-desc,"子女")]


${Catogory-Diet}    //android.widget.ImageView[contains(@content-desc,"飲食")]
${Catogory-Daily-Use}    //android.widget.ImageView[contains(@content-desc,"日用")]
${Catogory-Transportation}    //android.widget.ImageView[contains(@content-desc,"交通")]
${Catogory-Social-Contact}    //android.widget.ImageView[contains(@content-desc,"社交")]
${Catogory-House}    //android.widget.ImageView[contains(@content-desc,"住房物業")]
${Catogory-Present}    //android.widget.ImageView[contains(@content-desc,"禮物")]

${Catogory-Communication}    //android.widget.ImageView[contains(@content-desc,"通信")]
${Catogory-Clothes}    //android.widget.ImageView[contains(@content-desc,"服飾")]
${Catogory-Entertainment}    //android.widget.ImageView[contains(@content-desc,"娛樂")]
${Catogory-Cosmetic}    //android.widget.ImageView[contains(@content-desc,"美容")]
${Catogory-Medical}    //android.widget.ImageView[contains(@content-desc,"醫療")]
${Catogory-Tax}    //android.widget.ImageView[contains(@content-desc,"稅金")]

${Catogory-Diet-Delete}    //android.widget.ImageView[contains(@content-desc,"飲食 自己 -NT$900 默認帳戶")]

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

Add New Expense For 900 Dollars By Different Catogory
    [Arguments]    ${Catogory}

    Wait Until Element Is Visible    ${ACCOUNT-ICON}
    Click Element    ${ACCOUNT-ICON}
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}

    Wait Until Element Is Visible    ${Catogory}
    Click Element    ${Catogory}
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
