*** Settings ***
Documentation   To get data from externall file

Library  ../CustomLibs/CsvReader.py

*** Keywords ***

Get CSV data
  [Arguments]   ${filePath}
  ${data} =   read csv file  ${filePath}
  [Return]  ${data}
