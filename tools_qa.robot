*** Settings ***
Library  SeleniumLibrary

*** Variables ***
### General ###
${URL}        https://demoqa.com/
${Browser}    chrome

### Data test###
${firstName}        Anakin
${lastName}         Skywalker
${email}            lord.vader@darth.com
${mobile}           555-5555

### Elements ###
${inputFirstName}                         //input[@placeholder="First Name"] 
${inputLastName}                         //input[@placeholder="Last Name"]
${inputEmail}                           //input[@placeholder="name@example.com"]
${inputRadioGender}                    //label[@for="gender-radio-1"]
${inputMobile}                        //input[@placeholder="Mobile Number"]
${inputCheckboxHobbiesReading}       //label[@for="hobbies-checkbox-2"]
${inputCheckboxHobbiesMusic}        //label[@for="hobbies-checkbox-3"]


*** Keywords ***
we access the website
    Open Browser                         ${URL}        ${Browser}
    Maximize Browser Window
fill out form
    Wait Until Element Is Visible        ${inputFirstName}                                10s    
    Input Text                           ${inputFirstName}                ${firstName}
    Wait Until Element Is Visible        ${inputLastName}                                 10s
    Input Text                           ${inputLastName}                 ${lastName}
    Wait Until Element Is Visible        ${inputEmail}                                    10s
    Input Text                           ${inputEmail}                    ${email}
    Wait Until Element Is Visible        ${inputMobile}                                   10s
    Input Text                           ${inputMobile}                   ${mobile}
select gender
    Wait Until Element Is Visible        ${inputRadioGender}                              10s
    Click Element                        ${inputRadioGender}
select hobbies
    Wait Until Element Is Visible        ${inputCheckboxHobbiesReading}                   10s
    Click Element                        ${inputCheckboxHobbiesReading}
    Wait Until Element Is Visible        ${inputCheckboxHobbiesMusic}                     10s
    Click Element                        ${inputCheckboxHobbiesMusic}

close the page
    Close Browser

*** Test Cases ***
TC01: Fill out form
    Given we access the website
    When fill out form
    And select gender
    And select hobbies
    Then close the page