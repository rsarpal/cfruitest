*** Settings ***
Documentation  This is the root test case to run all tests

Resource  ../../Resources/Includes.robot

Suite Teardown  Close All Browsers

*** Variables ***
#these  variables are for Landingpage.robot and then for BrowserSettings.robot
${BROWSER}  chrome
${URL}  http://192.168.1.36:8080
${match_landing_Success}  index page
${Global_match_loginForm}  Username
${filepath} =  \/Data\/loginids.csv

*** Test Cases ***
Test Landing Page
    [Documentation]  Test login page
    [Tags]  Launch
    LaunchPage.Landing Page Launch  ${BROWSER}  ${URL}  ${match_landing_Success}


All Login Case
    [Tags]  Login
    LaunchPage.Landing Page Launch  ${BROWSER}  ${URL}  ${match_landing_Success}
    LaunchPage.Login Page Launch  ${Global_match_loginForm}
    TestLogin.Login Multiple   ${filepath}
