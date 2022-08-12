*** Settings ***
Library     SeleniumLibrary     # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html


*** Variables ***
${opcoes}        class:custom-select
${opcao}         //option[contains(text(), "Italy")]


*** Keywords ***
Abrir Navegador e Acessar Site        
    Open Browser        https://itera-qa.azurewebsites.net/home/automation        chrome

Abrir a lista de opções
    Click Element        ${opcoes}

Selecionar Itália
    Click Element        ${opcao}
Fechar Navegador        
    Close Browser

*** Test Cases ***
Cenário 1: Utilização do DropDown
    Abrir Navegador e Acessar Site
    Abrir a lista de opções
    Selecionar Itália
    Fechar Navegador

