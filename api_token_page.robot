*** Settings ***
Library      SeleniumLibrary
Library      String
Library      Collections
Library      RequestsLibrary
Library    XML
Resource    ./variables.robot
Resource    ./keywords.robot

*** Test Cases ***
#check all trade types and paltforms exist in the main page
All scope with token name
    Login Account
    Open API page
    Select All Scope
    Fill In Invalid Input
    Fill In Valid Input and Create Token
    Check Token Created
    Check Copy Token
    Check Show Token Function
    Check Delete Function

Empty Scope With Token name
    Check Button Disabled With Token Name
    Check Button Disabled With Scopes
    Check Token Created Without Admin
    