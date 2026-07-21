*** Settings ***
Resource    ../resources/pages/CancelarPassagemFluxo.resource

Suite Teardown    Close Browser


*** Test Cases ***
Cancelar Passagem Com Sucesso
    Fluxo Completo De Cancelamento