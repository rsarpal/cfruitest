*** Settings ***
Resource  ../BrowserSettings.robot



*** Keywords ***
Landing Page Launch
   [Arguments]  ${browser}  ${url}  ${textMatch}
   BrowserSettings.Launch Browser     ${browser}       ${url}
   Wait Until Page Contains    ${textMatch}

Login Page Launch
  [Arguments]   ${Global_match_loginForm}
  Login.Login Link    ${Global_match_loginForm}
