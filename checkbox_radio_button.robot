*** Settings ***
Library     SeleniumLibrary     # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

*** Variables ***
${genero}                  id:male
${segunda}                 id:monday
${quarta}                  id:wednesday
${sabado}                  id:saturday
${experienciaRadio}        //label[contains(text(), "3 years")]
${seleniumCheckBox}        //label[contains(text(), "Selenium Webdriver")]

*** Keywords ***
Abrir Navegador e Acessar Site
    Open Browser        https://itera-qa.azurewebsites.net/home/automation        chrome
Selecionar Gênero
    Click Element        ${genero}
Selecionar dias da semana
    Click Element        ${segunda}
    Click Element        ${quarta}
    Click Element        ${sabado}
Selecionar Experiência
    Click Element        ${experienciaRadio}
Selecionar Frameworks
    Click Element    ${seleniumCheckBox}
Fechar Navegadores
    Close All Browsers

*** Test Cases ***
Cenário 1: Preenche CheckBox & Radio Button practice
    Abrir Navegador e Acessar Site
    Selecionar Gênero
    Selecionar dias da semana
Cenário 2: Preenche CheckBox & Radio Button practice Xpath
    Selecionar Experiência
    Selecionar Frameworks
    Fechar Navegadores
