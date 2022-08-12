*** Settings ***
Library  SeleniumLibrary

*** Variables ***
### General ###
${URL}        https://itera-qa.azurewebsites.net/home/automation
${Browser}    chrome

### Data input in Textarea practice ###
${name}       Oliver Sykes
${phone}      55-5555
${email}      oli.sykes@bmth.com
${password}   emo
${address}    England, London, 3 A Kensington Garden No 8

### Textarea practice Elements ###
${inputName}                //input[@id="name"]
${inputMobileNumber}       //input[@id="phone"]
${inputEmailAddress}      //input[@id="email"]
${inputPassword}         //input[@id="password"]
${textareaAddress}      //textarea[@id="address"]
${buttonSubmit}        //button[@name="submit"]

### CheckBox & Radio Button practice Elements ###
${inputRadioGender}        //input[@id="female"]
&{inputDays}
...  monday=//input[@id="monday"]
...  friday=//input[@id="friday"]
...  sunday=//input[@id="sunday"]

### DropDown practice Elements ###
${selectTravel}           //select[@class="custom-select"]
${optionTravel}          //option[contains(text(), "Italy")]

*** Keywords ***
we access the website
    Open Browser                         ${URL}        ${Browser}
    Maximize Browser Window
fill out form
    Wait Until Element Is Visible        ${inputName}                                10s    
    Input Text                           ${inputName}                ${name}
    Wait Until Element Is Visible        ${inputMobileNumber}                        10s
    Input Text                           ${inputMobileNumber}        ${phone}
    Wait Until Element Is Visible        ${inputEmailAddress}                        10s
    Input Text                           ${inputEmailAddress}        ${email}
    Wait Until Element Is Visible        ${inputPassword}                            10s
    Input Text                           ${inputPassword}            ${password}
    Wait Until Element Is Visible        ${textareaAddress}                          10s
    Input Text                           ${textareaAddress}          ${address}
click in the submit button
    Wait Until Element Is Visible        ${buttonSubmit}                             10s
    Element Should Be Visible            ${buttonSubmit}
    Click Element                        ${buttonSubmit}

close the page
    Close Browser

select gender
    Wait Until Element Is Visible        ${inputRadioGender}                         10s    
    Click Element                        ${inputRadioGender}
select the days of the week
    Wait Until Element Is Visible        ${inputDays.monday}                         10s
    Click Element                        ${inputDays.monday}
    Wait Until Element Is Visible        ${inputDays.friday}                         10s
    Click Element                        ${inputDays.friday}    
    Wait Until Element Is Visible        ${inputDays.sunday}                         10s
    Click Element                        ${inputDays.sunday}
click on the dropdown
    Wait Until Element Is Visible        ${selectTravel}                             10s
    Click Element                        ${selectTravel}

select the option ${county}
    Wait Until Element Is Visible        ${optionTravel}                             10s
    Element Should Be Visible            ${optionTravel}
    Click Element                        ${optionTravel}
    Click Element                        ${optionTravel}

*** Test Cases ***
TC01: Fill out form
    Given we access the website
    When fill out form
    And click in the submit button
    Then close the page

TC02: Click the CheckBox & Radio Button
    Given we access the website
    When select gender
    And select the days of the week
    Then close the page

TC03: Select Italy on Dropdown
    Given we access the website
    When click on the dropdown
    And select the option Italy
    Then close the page