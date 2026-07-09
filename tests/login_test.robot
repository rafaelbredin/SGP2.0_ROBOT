*** Settings ***
Library           Browser
Resource          ../resources/variables.robot
Resource          ../resources/pages/LoginPage.resource

Suite Setup       New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***
${EMAIL}      %{PV_EMAIL}
${PASSWORD}   %{PV_PASSWORD}
${email_invalido}      qualquer coisa
${erro_email_invalido}      text=Não conseguimos encontrar sua conta.
${email_vazio}      ""

*** Test Cases ***

Sanidade - Portal Carrega
    New Page    ${BASE_URL}
    Wait For Load State    networkidle
    Get Title    !=    ${EMPTY}

Login Com Sucesso
    New Page       ${BASE_URL}
    Wait For Load State    networkidle
    Fazer Login    ${EMAIL}    ${PASSWORD}
    Wait For Load State    networkidle    timeout=${TIMEOUT}
    Get Url    ==    https://tremdepassageiros-pv-qa.valeglobal.net/
    Get Element    ${COMPRA_HEADING}
    
Login Com Email Invalido
    New Page       ${BASE_URL}
    Wait For Load State    networkidle
    Fazer Login    ${email_invalido}     ${PASSWORD}
    Wait For Elements State    ${erro_email_invalido}    
    
Login Com Email Invalido
    New Page       ${BASE_URL}
    Wait For Load State    networkidle
    Fazer Login    ${email_vazio}      ""
    Wait For Elements State    ${erro_email_invalido}    