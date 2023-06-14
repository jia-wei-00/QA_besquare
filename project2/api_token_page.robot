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
    Open Close Account Page
    Check On Security And Privacy Documentation
    Check Cancel Button
    Open Close Account Page

Testing 1
    Check Continue Button

Testing 2
    Check modal

Testing 3
    Check Account Login After Close