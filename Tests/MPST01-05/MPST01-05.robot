*** Settings ***
Documentation    分析支出
Library  AppiumLibrary

Resource    ../Variables.txt
Resource    ../Keywords.txt

*** Variables ***


${title}    //android.view.View[@content-desc="日期 收入 支出 總額"]
${total}    //android.widget.ImageView[contains(@content-desc,"總額")]
#            //android.widget.ImageView[@content-desc="總額 NT$0 NT$9 -NT$9"]
${0614}    //android.widget.ImageView[contains(@content-desc,"06-14")]

*** Keywords ***
Enter 900 Dollars
    Click    ${BOTTON9}
    Click    ${BOTTON0}
    Click    ${BOTTON0}
    Click    ${CONFIRM}

Add 900 Dollars By Different Type
    [Arguments]    ${Type}

    Click    ${ACCOUNT-ICON}
    Click    ${EDIT-ICON}
    Click    ${Type}
    Enter 900 Dollars

*** Test Cases ***
MPST01_05
    #Happy path
    Open Money Plus

    FOR  ${Index}  IN RANGE  2
        Add 900 Dollars By Different Type    ${INCOME-ICON}
    END

    FOR  ${Index}  IN RANGE  3
        Add 900 Dollars By Different Type    ${EXPENSE-ICON}
    END

    Click    ${PICTURE-ICON}

    Click    ${AnalysisCatogory-Assets-Trend}


    Wait Until Element Is Visible    ${total}
    Wait Until Page Contains Element  ${total}

    Element Attribute Should Match    ${total}     content-desc    總額\n-NT$900\n-NT$900
    Element Attribute Should Match    ${0614}     content-desc    06-14\n-NT$900\n-NT$900


