*** Settings ***
Library           Browser
Resource          ../resources/variables.robot
Resource          ../resources/pages/LoginPage.resource
Resource          ../resources/pages/ComprarPassagemPage.resource


Suite Setup       New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***
${EMAIL}      rafaelbreder10@gmail.com
${PASSWORD}   Vaisefude01@

*** Test Cases ***

Comprar Passagem
    New Page       ${BASE_URL}
    Wait For Load State    networkidle
    Fazer Login    ${EMAIL}    ${PASSWORD}  

    Preencher Campos de Viagem
    Preencher Informacoes da Viagem
    Confirmar Compra   


