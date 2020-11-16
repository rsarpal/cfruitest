*** Settings ***
Resource  Includes.robot


*** Keywords ***

Launch Browser
    [Documentation]  Launch a Browser , Arguments ${browser} = safari or chrome or firefox ,  ${url}
    [Arguments]  ${browser}  ${url}
    Run Keyword If    "${browser}"=="safari"     Open Safari    ${url}
    Run Keyword If    "${browser}"=="chrome"     Open Chrome    ${url}
    Run Keyword If    "${browser}"=="firefox"    Open Firefox   ${url}

Open Safari
    [Documentation]   Launch Safari Browser Window
    [Arguments]    ${url}
    Open Browser    ${url}    safari
    Set Window Size   1024  768

Open Chrome
    [Documentation]   Headless(no browser Chrome GUI) RUN for DOCKER
    [Arguments]    ${url}
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()        sys,selenium.webdriver
    Call Method  ${chrome_options}  add_argument   --disable-extensions
    Call Method  ${chrome_options}  add_argument   --headless
    Call Method  ${chrome_options}  add_argument   --disable-gpu
    Call Method  ${chrome_options}  add_argument   --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size   1024  768
    Go To   ${url}


#Headless Firefox (no browser GUI) RUN for DOCKER
Open Firefox
        [Documentation]   Headless(no browser Firefox GUI) RUN for DOCKER
        [Arguments]    ${url}
        ${firefox options} =     Evaluate    sys.modules['selenium.webdriver'].firefox.webdriver.Options()    sys, selenium.webdriver
        Call Method    ${firefox options}   add_argument    -headless
        Create Webdriver    Firefox    firefox_options=${firefox options}
        Set Window Size    1500    1500
        Go To    ${url}
