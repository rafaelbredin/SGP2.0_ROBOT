*** Settings ***
Library    Browser
Library    String
Library    Collections


*** Variables ***

# Modal
${BTN_MODAL_OK}                     xpath=(//button[normalize-space(.)="Ok"])[1]

# Tipo de viagem
${BTN_VIAGEM_SO_IDA}                xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[2]/div
${BTN_VIAGEM_IDA_VOLTA}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div

# Ferrovia
${OPCAO_FERROVIA_EFC}               xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro de Carajás (EFC)"])[last()]
${OPCAO_FERROVIA_EFVM}              xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro Vitória-Minas (EFVM)"])[last()]

# Origem / Destino
${CAMPO_ORIGEM}                     xpath=(//div[contains(@class,"sc-iEqALP")])[1]
${CAMPO_DESTINO}                    xpath=(//div[contains(@class,"sc-iEqALP")])[2]
${CIDADE_ORIGEM}                    xpath=(//*[normalize-space(.)="São Luis" or normalize-space(.)="São Luís"])[last()]
${CIDADE_DESTINO}                   xpath=(//*[normalize-space(.)="Arari"])[last()]

# Data da viagem
${CAMPO_DATA}                       xpath=(//button[.//span[contains(normalize-space(.),"Selecione")]])[1]
${DATA_ESCOLHIDA}                   xpath=(//div[@role="option" and @aria-disabled="false" and contains(@class,"react-datepicker__day") and not(contains(@class,"outside-month"))])[1]

# Tipo de passagem
${BTN_TIPO_PASSAGEM}                xpath=(//button[contains(normalize-space(.),"Tipos de Passagem") and not(@disabled)])[1]
${OPCAO_TARIFA_NORMAL}              xpath=//div[@title="Tarifa Normal"]

# Passageiros
${QTD_ADULTO}                       xpath=(//span[@aria-live="polite"])[1]
${BTN_MAIS_ADULTO}    xpath=//div[@role="group" and @aria-label="Tarifa Normal"]//button[last()]
${BTN_CONFIRMAR_PASSAGEIROS}        xpath=(//button[contains(normalize-space(.),"Confirmar") and not(@disabled)])[last()]

# Limpar seleção
${BTN_LIMPAR_SELECOES}              xpath=(//button[contains(normalize-space(.),"Limpar Seleções")])[1]

# Escolha de assentos
${BTN_SEGUIR_ESCOLHA_ASSENTOS}      xpath=//*[@id="root"]/div[3]/div/div[4]/span/button
${BTN_CONCORDAR_TERMOS}             xpath=//*[@id="root"]/div[3]/div[2]/div/div[3]/button[2]
${PRIMEIRO_ASSENTO_DISPONIVEL}      xpath=(//span[@role="button" and @tabindex="0"])[1]

# Dados do passageiro
${CAMPO_NOME}                       css=input[placeholder="Insira seu Nome Completo"]
${CAMPO_NOME_SOCIAL}                css=input[name="nome-social-0"]
${CAMPO_DATA_NASCIMENTO}            css=input[placeholder="Insira data de nascimento"]
${CAMPO_EMAIL}                      css=input[placeholder="Insira seu E-mail"]
${SELECT_DOCUMENTO}                 xpath=//select[@aria-label="Tipo de documento"]
${CAMPO_NUMERO_DOCUMENTO}           css=input[placeholder="Número do documento"]
${CAMPO_CPF}                        css=input[placeholder="Insira o CPF"]
${CAMPO_TELEFONE}                   css=input[placeholder="Insira seu telefone"]
${SELECT_NECESSIDADE_ESPECIAL}      xpath=//select[@id="necessidade-especial-0"]
${BTN_SEGUIR_PAGAMENTO}             xpath=(//button[contains(normalize-space(.),"Seguir para Pagamento") and not(@disabled)])[1]

# Massa de dados
${NOME_SOCIAL}                      Rafael
${DATA_NASCIMENTO}                  01/01/2000
${CPF}                              73316388079
${TELEFONE}                         99999999999
${NOME_PASSAGEIRO}                  AT
${EMAIL}                            teste@gmail.com
${DOCUMENTO}                        12345678

# Dados do cartao 
${CARTAO_TESTE}                     5502 0937 6992 1690
${VALIDADE_TESTE}                   12/30
${CVV_TESTE}                        123
${NOME_CARTAO_TESTE}                CLIENTE TESTE


*** Keywords ***

Fechar Modal De Boas Vindas
    Wait For Elements State    ${BTN_MODAL_OK}    visible    timeout=15s
    Click                      ${BTN_MODAL_OK}


Preencher Campos de Viagem
    Wait For Elements State    ${BTN_LIMPAR_SELECOES}    visible    timeout=30s
    Click                      ${BTN_LIMPAR_SELECOES}
    Sleep                      2s

    Wait For Elements State    ${BTN_VIAGEM_SO_IDA}    visible    timeout=30s
    Click                      ${BTN_VIAGEM_SO_IDA}
    Sleep                      3s

    Wait For Elements State    ${OPCAO_FERROVIA_EFC}    visible    timeout=30s
    Click                      ${OPCAO_FERROVIA_EFC}
    Sleep                      2s

    Click                      ${CAMPO_ORIGEM}
    Wait For Elements State    ${CIDADE_ORIGEM}    visible    timeout=30s
    Click                      ${CIDADE_ORIGEM}

    Click                      ${CAMPO_DESTINO}
    Wait For Elements State    ${CIDADE_DESTINO}    visible    timeout=30s
    Click                      ${CIDADE_DESTINO}

    Click                      ${CAMPO_DATA}
    Wait For Elements State    ${DATA_ESCOLHIDA}    visible    timeout=30s
    Click                      ${DATA_ESCOLHIDA}
    Sleep                      3s

    Wait For Elements State    ${BTN_TIPO_PASSAGEM}    enabled    timeout=60s
    Click                      ${BTN_TIPO_PASSAGEM}

    Wait For Elements State    ${OPCAO_TARIFA_NORMAL}    visible    timeout=30s
    Click                      ${OPCAO_TARIFA_NORMAL}

    Sleep                      3s

    Wait For Elements State    ${BTN_MAIS_ADULTO}    enabled    timeout=30s
    Click                      ${BTN_MAIS_ADULTO}

    Wait For Elements State    ${BTN_CONFIRMAR_PASSAGEIROS}    enabled    timeout=30s
    Click                      ${BTN_CONFIRMAR_PASSAGEIROS}

    Wait For Elements State    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}    enabled    timeout=60s
    Click                      ${BTN_SEGUIR_ESCOLHA_ASSENTOS}

    Sleep                      5s

    Wait For Elements State    ${BTN_CONCORDAR_TERMOS}    visible    timeout=60s
    Click                      ${BTN_CONCORDAR_TERMOS}

    Sleep                      5s


Gerar Massa De Dados Aleatoria
    ${numero}=    Evaluate    random.randint(100,999)    random
    ${nome}=      Set Variable    RF AUTOMACAO ${numero}

    ${email}=     Evaluate    ''.join(random.choice('abcdefghijklmnopqrstuvwxyz') for _ in range(12)) + '@gmail.com'    random

    ${rg}=        Evaluate    str(random.randint(10000000,99999999))    random

    Set Test Variable    ${NOME_PASSAGEIRO}    ${nome}
    Set Test Variable    ${EMAIL}              ${email}
    Set Test Variable    ${DOCUMENTO}          ${rg}


Preencher Informacoes da Viagem
    Gerar Massa De Dados Aleatoria
    Wait For Elements State    ${PRIMEIRO_ASSENTO_DISPONIVEL}    visible    timeout=120s
    Click                      ${PRIMEIRO_ASSENTO_DISPONIVEL}

    Sleep                      10s

    Wait For Elements State    ${CAMPO_NOME}    visible    timeout=120s
    Fill Text                  ${CAMPO_NOME}    ${NOME_PASSAGEIRO}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_NOME_SOCIAL}    visible    timeout=30s
    Fill Text                  ${CAMPO_NOME_SOCIAL}    ${NOME_SOCIAL}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_DATA_NASCIMENTO}    visible    timeout=30s
    Fill Text                  ${CAMPO_DATA_NASCIMENTO}    ${DATA_NASCIMENTO}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_EMAIL}    visible    timeout=30s
    Fill Text                  ${CAMPO_EMAIL}    ${EMAIL}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_NUMERO_DOCUMENTO}    visible    timeout=30s
    Fill Text                  ${CAMPO_NUMERO_DOCUMENTO}    ${DOCUMENTO}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_CPF}    visible    timeout=30s
    Fill Text                  ${CAMPO_CPF}    ${CPF}

    Sleep                      2s

    Wait For Elements State    ${CAMPO_TELEFONE}    visible    timeout=30s
    Fill Text                  ${CAMPO_TELEFONE}    ${TELEFONE}

    Sleep                      3s

    Wait For Elements State    ${BTN_SEGUIR_PAGAMENTO}    enabled    timeout=60s
    Click                      ${BTN_SEGUIR_PAGAMENTO}

    Sleep                      10s


Confirmar Compra
    Wait For Elements State    xpath=//button[contains(normalize-space(.),"Gerar passagem")]    visible    timeout=60s

    Scroll To Element    xpath=//button[contains(normalize-space(.),"Gerar passagem")]

    Click    xpath=//button[contains(normalize-space(.),"Gerar passagem")]

    Wait For Load State    networkidle

    Wait For Elements State    xpath=//body    visible    timeout=30s

    Sleep    20s

Preencher Dados de Pagamento
    Log    Iniciando preenchimento pagamento

    Wait For Elements State    xpath=//*[@id="card_number"]    visible    timeout=60s
    Log    Campo cartão localizado

    Click                      xpath=//*[@id="card_number"]
    Fill Text                  xpath=//*[@id="card_number"]    ${CARTAO_TESTE}

    Sleep                      3s

    Wait For Elements State    xpath=//*[@id="card_validity"]    visible    timeout=30s
    Log    Campo validade localizado

    Click                      xpath=//*[@id="card_validity"]
    Fill Text                  xpath=//*[@id="card_validity"]    ${VALIDADE_TESTE}

    Sleep                      3s

    Wait For Elements State    xpath=//*[@id="card_cvv"]    visible    timeout=30s
    Log    Campo CVV localizado

    Click                      xpath=//*[@id="card_cvv"]
    Fill Text                  xpath=//*[@id="card_cvv"]    ${CVV_TESTE}

    Sleep                      3s

    Wait For Elements State    xpath=//*[@id="card_name"]    visible    timeout=30s
    Log    Campo nome localizado

    Click                      xpath=//*[@id="card_name"]
    Fill Text                  xpath=//*[@id="card_name"]    ${NOME_CARTAO_TESTE}

    Sleep                      3s

Finalizar Pagamento
    Log    Preparando finalização do pagamento

    Wait For Elements State    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div[1]/div[2]/button    visible    timeout=60s

    Scroll To Element    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div[1]/div[2]/button

    Sleep    3s

    Click    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div[1]/div[2]/button

    Log    Clique realizado, aguardando redirecionamento

    Sleep    10s


Validar Nova Pagina
    ${URL_ATUAL}=    Get Url
    Log    URL atual: ${URL_ATUAL}

    Wait For Elements State    xpath=//body    visible    timeout=60s

    Sleep    5s


Continuar Na Pagina De Viagens
    Log    Procurando botão Continuar na nova página

    Wait For Elements State    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[3]/div/div/div/button    visible    timeout=60s

    Scroll To Element    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[3]/div/div/div/button

    Sleep    3s

    Click    xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[3]/div/div/div/button

    Log    Botão Continuar clicado

    Sleep    10s

    Log    Navegador mantido aberto para análise

    Sleep    300s

Validar Proxima Pagina
    Log    Validando abertura da página travels

    Wait For Elements State    xpath=//body    visible    timeout=60s

    ${URL_ATUAL}=    Get Url
    Log    URL atual: ${URL_ATUAL}

    Should Contain    ${URL_ATUAL}    /travels

    Log    Página travels carregada com sucesso


Fechar Modal PDF
    Log    Fechando modal do PDF

    Wait For Elements State    xpath=//*[@id="radix-:r3:"]/button/span    visible    timeout=60s

    Click    xpath=//*[@id="radix-:r3:"]/button/span

    Log    Modal do PDF fechado

    Sleep    3s