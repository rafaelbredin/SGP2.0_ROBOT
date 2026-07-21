*** Settings ***
Library    Browser


*** Variables ***
${CAMPO_NUMERO_CARTAO}      id=card_number
${CAMPO_VALIDADE}           id=card_validity
${CAMPO_CVV}                id=card_cvv
${CAMPO_NOME_CARTAO}        id=card_name
${BTN_CONTINUAR_PAGAMENTO}  xpath=//button[contains(normalize-space(.),"Continuar")]
${BTN_CONFIRMAR_PAGAMENTO}  xpath=//button[contains(@class,"confirmation-btn") and normalize-space(.)="Confirmar"]

${NUMERO_CARTAO_TESTE}      5502 0937 6992 1690
${VALIDADE_CARTAO_TESTE}    12/32
${CVV_CARTAO_TESTE}         123
${NOME_CARTAO_TESTE}        CLIENTE TESTE


*** Keywords ***

Preencher Dados Do Cartao De Teste
    Wait For Elements State    ${CAMPO_NUMERO_CARTAO}    visible    timeout=30s

    Fill Text    ${CAMPO_NUMERO_CARTAO}    ${NUMERO_CARTAO_TESTE}
    Fill Text    ${CAMPO_VALIDADE}         ${VALIDADE_CARTAO_TESTE}
    Fill Text    ${CAMPO_CVV}              ${CVV_CARTAO_TESTE}
    Fill Text    ${CAMPO_NOME_CARTAO}      ${NOME_CARTAO_TESTE}

    Sleep    1s


Confirmar Pagamento
    Wait For Elements State    ${BTN_CONTINUAR_PAGAMENTO}    enabled    timeout=15s
    Click                      ${BTN_CONTINUAR_PAGAMENTO}
    Sleep    3s

    Wait For Elements State    ${BTN_CONFIRMAR_PAGAMENTO}    visible    timeout=15s
    Click                      ${BTN_CONFIRMAR_PAGAMENTO}
    Sleep    10s