

#    Esse teste deve entrar no site do youtube, pesquisar o nome de uma música 
#    e fechar o Browser quando o timer do vídeo terminar.

#    Para pesquisar vídeos diferentes altere as variáveis ${music_name} e ${video_duration}



*** Settings ***
Library     SeleniumLibrary     # https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html


*** Variables ***
#Data Test
${music_name}            metallica master of puppets

#Configuration Variables
${URL}                   https://www.youtube.com/
${Browser}               chrome
${video_duration}        518s

#Elements
${search_input}          //input[@id="search"]
${search_button}         //button[@id="search-icon-legacy"]
${first_result}          (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${skip_button}           //button[@class="ytp-ad-skip-button ytp-button"]

*** Keywords ***
that we visit youtube website
    Open Browser                         ${URL}                 ${Browser}
typed the name of the music
    Input Text                           ${search_input}        ${music_name}
click the search button
    Click Element                        ${search_button}
click the first option in the list
    Wait Until Element Is Visible        ${first_result}        10
    Click Element                        ${first_result}
the video is played
    Wait Until Element Is Visible        ${skip_button}         7
    Element Should Be Visible            ${skip_button}
    Click Element                        ${skip_button}
close the browser
    Sleep                                ${video_duration}
    Close Browser

*** Test Cases ***
Case 1: Playing a song video to the end
    Given that we visit youtube website
    When typed the name of the music
    And click the search button
    And click the first option in the list
    And the video is played
    Then close the browser
