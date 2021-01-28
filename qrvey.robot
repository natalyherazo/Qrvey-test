*** Settings ***
Documentation   Nataly Herazo

Library         SeleniumLibrary

*** Variables ***
${Browser}      chrome
${Gmail_Url}          https://accounts.google.com/ServiceLogin/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=AddSession
${EmailAddress}   aspirantforqrvey@gmail.com
${Password}     test123.
${Destination_Email}          natalyherazovasquez@gmail.com
${Text_Email}   Hello world

***Keywords***
Login Gmail
    Open Browser    ${Gmail_Url}     ${Browser}
    Wait until element is visible       xpath=//*[@id="headingText"]/span
    Input text      xpath=//*[@id="identifierId"]      ${EmailAddress}
    Click element   xpath=//*[@id="identifierNext"]/div/button/div[2]
    Wait until element is visible       xpath=//*[@id="headingText"]/span
    sleep   7s
    Input text      xpath=//*[@id="password"]/div[1]/div/div[1]/input     ${Password}
    Click element   xpath=//*[@id="passwordNext"]/div/button/div[2]
    Wait until page contains    Recibidos

New Email form Gmail
    Click element   xpath=//*[@id=":2q"]/div/div
    sleep   7s
    Wait until page contains    Mensaje nuevo



*** Test Cases ***
Access to Gmail
    Login Gmail

Access to New Email form Gmail
    New Email form Gmail

Send a new email with the basic fields-Gmail
    New Email form Gmail
    Click element   xpath=//*[@id=":2q"]/div/div
    Click Element    //div[@class="T-I T-I-KE L3"]
    Input Text    //textarea[@name="to"]   ${Destination_Email}
    Input Text    //input[@name="subjectbox"]   ${Text_Email}
    Click Element    //div[@id=":56"]
   Input text   xpath=//div[@aria-label="cuerpodelmensaje"]${Text_Email}
    Click Element    //div[@id=":er"]



Send a new email with the CC and BCC-Gmail
    New Email form Gmail
    Click Element    //div[@class="T-I T-I-KE L3"]
    Input text   xpath=//textarea[@name="to"]   ${Destination_Email}
    Click element   xpath=//*[@id=":9m"]
    Input text   xpath=//*[@id=":9m"]   test123@gmail.com
    Click element   xpath=//*[@id=":9y"]
    Input text   xpath=//*[@id=":6d"]   test1234@gmail.com
    Input text   xpath=//input[@name="subjectbox"]]   QA test 2
    Input text   xpath=//div[@aria-label="cuerpodelmensaje"]   ${Text_Email}
    Click element   xpath=//*[@id=":88"]
    Close Browser

Send a new email to yourself and verify it on the inbox- Gmail
    New Email form Gmail

    Click Element    //div[@class="T-I T-I-KE L3"]
    Input text   xpath=//textarea[@name="to"]   ${EmailAddress}
    Input text   xxpath=//input[@name="subjectbox"]   QA test 3
    Input text   xpath=//div[@aria-label="cuerpodelmensaje"]]   ${Text_Email}
    Click element   xpath=//*[@id=":88"]
    Click element   xpath=//*[@id=":40"]/div/div[2]
    Page should contain     QA test 3
    Close Browser

Discard draft- Gmail
    New Email form Gmail
    Click Element    //div[@class="T-I T-I-KE L3"]
    Input text   xpath=//textarea[@name="to"]   ${Destination_Email}
    Input text   xpath=//input[@name="subjectbox"]   QA test 4
    Click element   xpath=//*[@id="gb"]/div[2]/div[1]/div[4]/div/a/img
    Page should contain     draft saved
    Click element   xpath=//*[@id=":47"]/div/div[2]
    Click element   xpath=//*[@id=":o7"]
    Click element     xpath=//*[@id=":k9"]/div/div/div
    Close Browser

Delete the very top message at the inbox
    Login Gmail
    Click element   xpath=//*[@id=":2s"]/span/span
    Click element   xpath=//*[@id=":4"]/div[3]/div[1]/div/div[2]/div[3]
    Close Browser
