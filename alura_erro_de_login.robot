*** Settings ***
Library  SeleniumLibrary

*** Variables ***
### General ###
${URL}        https://cursos.alura.com.br/
${Browser}    chrome

### Data test###
${email}            darth.maul@darkside.com
${password}         kenobi

### Elements ###
${inputEmail}                //input[@id="login-email"]
${inputPassword}            //input[@id="password"]
${buttonEntrar}            //button[contains(text(), "Entrar")]
${divErrorMessage}        //div[@class="error-info"]

*** Keywords ***
we acess the Alura Website
    Open Browser                         ${URL}        ${Browser}
    Maximize Browser Window
filled the login camps
    Wait Until Element Is Visible        ${inputEmail}        10s
    Input Text                           ${inputEmail}        ${email}
    Wait Until Element Is Visible        ${inputEmail}        10s
    Input Text                           ${inputPassword}        ${password}
click on the button Entrar
    Wait Until Element Is Visible        ${buttonEntrar}        10s
    Click Element                        ${buttonEntrar}
validated the login error message
    Wait Until Element Is Visible        ${divErrorMessage}        10s
    Element Should Be Visible            ${divErrorMessage}
close the page
    Close Browser

*** Test Cases ***
TC01: Validate login error
    Given we acess the Alura Website
    When filled the login camps
    And click on the button Entrar
    And validated the login error message
    Then close the page