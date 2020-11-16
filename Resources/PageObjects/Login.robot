*** Settings ***
Resource  ../BrowserSettings.robot

*** Variables ***

${username_InputBox} =  xpath://input[@id="username"]
${password_InputBox} =  xpath://input[@id="password"]
${login_Button} =  xpath://input[@value="Log In"]
${logout_Href} =  xpath://a[text()='Log Out']
${login_Href} =  xpath://a[text()='Log In']


*** Keywords ***

Enter Credentials
  [Arguments]  ${username}  ${password}
  Input Text    ${username_InputBox}  ${username}
  Input Text    ${password_InputBox}  ${password}
  #Capture Page Screenshot


Login Submit
  [Arguments]   ${testtype}  ${validInvalid_text}
  Click Button  ${login_Button}
  Wait Until Page Contains    ${validInvalid_text}
  Capture Page Screenshot

Logout Link
  [Arguments]   ${match_landing_Success}
  Click Link    ${logout_Href}
  Wait Until Page Contains    ${match_landing_Success}

Login Link
  [Arguments]   ${match_loginForm}
  Click Link    ${login_Href}
  Wait Until Page Contains    ${match_loginForm}
