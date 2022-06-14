*** Settings ***
Documentation    分析支出
Library  AppiumLibrary
Resource    ./../Variables.txt
Resource    ./../Keywords.txt
Test Setup    Open Money Plus
Test Teardown    Close Money Plus
*** Variables ***
${PICTURE-ICON}    //android.widget.ImageView[contains(@content-desc,'圖表分析')]
${ChildItem}        //android.widget.ImageView[contains(@content-desc,"子女")]
${BudgetSetting}    //android.widget.ImageView[@content-desc="預算設定"]

${DietBudgetSetting}    //android.widget.ImageView[contains(@content-desc,"飲食")]
${DietBudgetSettingEditText}    //android.view.View[@content-desc="飲食"]/following-sibling::android.widget.EditText

${DailyBudgetSettingEditText}    //android.view.View[@content-desc="日用"]/following-sibling::android.widget.EditText
${DailyBudgetSetting}    //android.widget.ImageView[contains(@content-desc,"日用")]

${BudgetSettingConfirm}     //android.widget.Button[@content-desc="確定"]
${AnnualBudgetPage}      //android.view.View[@content-desc="年預算"]
${WeekBudgetPage}      //android.view.View[@content-desc="週預算"]
${BudgetPage-ChartAnalysis}     //android.view.View[@content-desc="預算"]

${Diet-BugdetChartAnalysis}     //android.widget.ImageView[contains(@content-desc,'飲食')]
${Daily-BugdetChartAnalysis}     //android.widget.ImageView[contains(@content-desc,"日用")]

${GO-BACK-BUTTON}      //android.widget.Button[@content-desc="返回"]
${SmallMenuButton}   //android.view.View[contains(@content-desc,'顯示選單')]
${AnnualBudgetInMenu}       //android.widget.Button[@content-desc="年預算"]
${WeekBudgetInMenu}       //android.widget.Button[@content-desc="週預算"]
${Chart}    //android.view.View[contains(@content-desc," / ")]

@{ExpenseCategory}  飲食  日用  交通  社交  住房物業    禮物  通信  服飾  娛樂  美容  醫療  稅金  教育  寶寶  寵物  旅行
#  飲食  日用  交通  社交  住房物業    禮物  通信  服飾  娛樂  美容  醫療  稅金  教育  寶寶  寵物  旅行
*** Keywords ***
Add New Expense For 900 Dollars By Myself
    [Arguments]     @{catogory}

    FOR     ${index}    ${item}     IN ENUMERATE  @{catogory}
        ${SelectedCatogory} =   Set Variable            //android.widget.ImageView[contains(@content-desc,'${item}')]
        Wait Until Element Is Visible    ${EDIT-ICON}
        Click Element    ${EDIT-ICON}
        Wait Until Element Is Visible    ${BOTTON9}
        Click Element    ${BOTTON9}
        Click Element    ${ButtonMutiply}
        Click Element    ${BOTTON1}
        Click Element    ${BOTTON0}
        Click Element    ${BOTTON0}
        Run Keyword If    ${index} > 11
        ...    Swipe    521    1149    0    -300
        Click Element    ${SelectedCatogory}
        Click Element    ${EQUAL}
        Click Element    ${CONFIRM}
    END


Add New Expense For 900 Dollars By Diet Catogory By Myself
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

Add New Expense For 100 Dollars By Daily Catogory By ChildMember
    Wait Until Element Is Visible    ${EDIT-ICON}
    Click Element    ${EDIT-ICON}
    Wait Until Element Is Visible    ${BOTTON1}
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

Change To Account Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${AccountExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${AccountExpenseInDelayMenuOfPictrueAnalize}

Change To Member Expense Page
    Click Element    ${DelayMenuButtonOfPictrueAnalize}
    Wait Until Element Is Visible    ${MemberExpenseInDelayMenuOfPictrueAnalize}
    Click Element    ${MemberExpenseInDelayMenuOfPictrueAnalize}

Set Diet Budget
    [Arguments]     ${budget}
    Wait Until Element Is Visible    ${DietBudgetSetting}
    Click Element    ${DietBudgetSetting}
    Wait Until Element Is Visible    ${DietBudgetSettingEditText}
    Input Text    ${DietBudgetSettingEditText}    ${budget}
    Click Element    ${BudgetSettingConfirm}

Set Daily Budget
    [Arguments]     ${budget}
    Wait Until Element Is Visible    ${DailyBudgetSetting}
    Click Element    ${DailyBudgetSetting}
    Wait Until Element Is Visible    ${DailyBudgetSettingEditText}
    Input Text    ${DailyBudgetSettingEditText}    ${budget}
    Click Element    ${BudgetSettingConfirm}

Change To Anual Budget Page In Budget Chart Anaylisis
    Click Element    ${SmallMenuButton}
    Wait Until Element Is Visible    ${AnnualBudgetInMenu}
    Click Element    ${AnnualBudgetInMenu}

Change To Week Budget Page In Budget Chart Anaylisis
    Click Element    ${SmallMenuButton}
    Wait Until Element Is Visible    ${WeekBudgetInMenu}
    Click Element    ${WeekBudgetInMenu}
*** Test Cases ***
MPST01_03_01
    [Tags]  HappyPath
    Add New Expense For 900 Dollars By Diet Catogory By Myself
    Add New Expense For 100 Dollars By Daily Catogory By ChildMember
    Wait Until Element Is Visible       ${SettingPage}
    Click Element       ${SettingPage}
    Wait Until Element Is Visible   ${BudgetSetting}
    Click Element    ${BudgetSetting}
    Set Diet Budget     500
    Set Daily Budget     1000
    Wait Until Element Is Visible    ${AnnualBudgetPage}
    Click Element    ${AnnualBudgetPage}
    Set Diet Budget     5000
    Set Daily Budget     10000
    Wait Until Element Is Visible    ${WeekBudgetPage}
    Click Element    ${WeekBudgetPage}
    Set Diet Budget     250
    Set Daily Budget     500

    Wait Until Element Is Visible    ${GO-BACK-BUTTON}
    Click Element    ${GO-BACK-BUTTON}

    Wait Until Element Is Visible   ${PICTURE-ICON}
    Click Element    ${PICTURE-ICON}
    Wait Until Element Is Visible    ${BudgetPage-ChartAnalysis}
    Click Element    ${BudgetPage-ChartAnalysis}

    Sleep  3

    Wait Until Element Is Visible    ${Diet-BugdetChartAnalysis}
    Element Attribute Should Match        ${Diet-BugdetChartAnalysis}   content-desc       飲食\n500\n180%\nNT$900\n-NT$400

    Element Attribute Should Match        ${Daily-BugdetChartAnalysis}   content-desc       日用\n1,000\n10%\nNT$100\nNT$900

    Wait Until Element Is Visible    ${Chart}
    Element Attribute Should Match      ${Chart}    content-desc    67%\n1,000 / 1,500

    Change To Anual Budget Page In Budget Chart Anaylisis

    Wait Until Element Is Visible    ${Diet-BugdetChartAnalysis}
    Element Attribute Should Match        ${Diet-BugdetChartAnalysis}   content-desc       飲食\n5,000\n18%\nNT$900\nNT$4,100

    Element Attribute Should Match        ${Daily-BugdetChartAnalysis}   content-desc       日用\n10,000\n1%\nNT$100\nNT$9,900
    Wait Until Element Is Visible    ${Chart}
    Element Attribute Should Match      ${Chart}    content-desc    7%\n1,000 / 15,000


    Change To Week Budget Page In Budget Chart Anaylisis

    Wait Until Element Is Visible    ${Diet-BugdetChartAnalysis}
    Element Attribute Should Match        ${Diet-BugdetChartAnalysis}   content-desc       飲食\n250\n360%\nNT$900\n-NT$650

    Element Attribute Should Match        ${Daily-BugdetChartAnalysis}   content-desc       日用\n500\n20%\nNT$100\nNT$400

    Wait Until Element Is Visible    ${Chart}
    Element Attribute Should Match      ${Chart}    content-desc    133%\n1,000 / 750

MPST01_03_02
    [Tags]  T2
    Add New Expense For 900 Dollars By Myself   @{ExpenseCategory}