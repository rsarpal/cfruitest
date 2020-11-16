*** Settings ***


*** Keywords ***

Login Multiple
  [Arguments]  ${filepath}
  [Tags]  LoginMultiple
  ${data} =  DataReader.Get CSV data  ${filepath}
  FOR  ${row}  IN  @{data}
    Run Keyword If    "${row}[2]"=="valid"   Valid Login    ${row}
    ...   ELSE                                Invalid Login   ${row}
    Sleep    3
  END


Valid Login
  [Arguments]  ${row}
  [Tags]  ValidLogin
  Log    ${row}[0]
  Log    ${row}[1]
  Login.Enter Credentials    ${row}[0]  ${row}[1]
  Login.Login Submit         ${row}[2]  ${row}[3]
  Login.Logout Link    ${match_landing_Success}
  #reset to login page
  Login.Login Link    ${Global_match_loginForm}

Invalid Login
  [Arguments]  ${row}
  [Tags]  InvalidLogin
  Login.Enter Credentials   ${row}[0]  ${row}[1]
  Login.Login Submit      ${row}[2]   ${row}[3]
  Login.Login Link    ${Global_match_loginForm}
