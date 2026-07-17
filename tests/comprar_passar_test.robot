*** Settings ***
Library           Browser
Resource          ../resources/variables.robot
Resource          ../resources/pages/LoginPage.resource
Resource          ../resources/pages/ComprarPassagemPage.resource


Suite Setup       New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser

*** Variables ***
${EMAIL}      %{PV_EMAIL}
${PASSWORD}   %{PV_PASSWORD}

*** Test Cases ***

Comprar Passagem
    New Page       ${BASE_URL}
    Wait For Load State    networkidle
    Fazer Login    ${EMAIL}    ${PASSWORD}  
    
    Preencher Campos de Viagem - Ida e Volta - EFC - Tarifa Normal
    Validar Campos Preenchidos
    Seguir Para Pagamento
    Confirmar Compra   
    Preencher Dados de Pagamento
    Finalizar Pagamento
    Confirmar Pagamento Safrapay
    Validar Nova Pagina
    Continuar Na Pagina De Viagens
    Validar Proxima Pagina
    Fechar Modal PDF