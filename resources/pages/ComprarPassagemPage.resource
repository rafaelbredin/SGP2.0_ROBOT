*** Settings ***
Library    Browser

*** Variables ***


# ==========================
# Modal
# ==========================

${BTN_MODAL_OK}
...    xpath=(//button[normalize-space(.)="Ok"])[1]



# ==========================
# Tipo de viagem
# ==========================

# SOMENTE SÓ IDA
${BTN_VIAGEM_SO_IDA}
...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[2]/div


# Apenas referência (não usar)
${BTN_VIAGEM_IDA_VOLTA}
...    xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div



# ==========================
# Ferrovia
# ==========================

${OPCAO_FERROVIA_EFC}
...    xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro de Carajás (EFC)"])[last()]


${OPCAO_FERROVIA_EFVM}
...    xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro Vitória-Minas (EFVM)"])[last()]



# ==========================
# Origem / Destino
# ==========================

${CAMPO_ORIGEM}
...    xpath=(//div[contains(@class,"sc-iEqALP")])[1]


${CAMPO_DESTINO}
...    xpath=(//div[contains(@class,"sc-iEqALP")])[2]



${CIDADE_ORIGEM}
...    xpath=(//*[normalize-space(.)="São Luis" or normalize-space(.)="São Luís"])[last()]


${CIDADE_DESTINO}
...    xpath=(//*[normalize-space(.)="Arari"])[last()]



# ==========================
# Data da viagem
# ==========================

${CAMPO_DATA}
...    xpath=(//button[.//span[contains(normalize-space(.),"Selecione")]])[1]


# Primeira data disponível
${DATA_ESCOLHIDA}
...    xpath=(//div[@role="option" and @aria-disabled="false" and contains(@class,"react-datepicker__day") and not(contains(@class,"outside-month"))])[1]



# ==========================
# Tipo de passagem
# ==========================

${BTN_TIPO_PASSAGEM}
...    xpath=(//button[contains(normalize-space(.),"Tipos de Passagem") and not(@disabled)])[1]


${OPCAO_TARIFA_NORMAL}
...    xpath=(//*[normalize-space(.)="Tarifa Normal"])[last()]



# ==========================
# Passageiros
# ==========================

${QTD_ADULTO}
...    xpath=(//span[@aria-live="polite"])[1]


# Botão +
${BTN_MAIS_ADULTO}
...    xpath=(//span[@aria-live="polite"]/ancestor::div[contains(@class,"sc-")][1]//button)[last()]


${BTN_CONFIRMAR_PASSAGEIROS}
...    xpath=(//button[contains(normalize-space(.),"Confirmar") and not(@disabled)])[last()]



# ==========================
# Limpar seleção
# ==========================

${BTN_LIMPAR_SELECOES}
...    xpath=(//button[contains(normalize-space(.),"Limpar Seleções")])[1]



# ==========================
# Escolha de assentos
# ==========================


# Botão "Seguir para escolha de assentos"
${BTN_SEGUIR_ESCOLHA_ASSENTOS}
...    xpath=//*[@id="root"]/div[3]/div/div[4]/span/button



${BTN_CONCORDAR_TERMOS}
...    xpath=//*[@id="root"]/div[3]/div[2]/div/div[3]/button[2]



# Primeiro assento livre
${PRIMEIRO_ASSENTO_DISPONIVEL}
...    xpath=(//span[@role="button" and @tabindex="0"])[1]



# ==========================
# Dados passageiro
# ==========================

${CAMPO_NOME}
...    css=input[placeholder="Insira seu Nome Completo"]


${CAMPO_NOME_SOCIAL}
...    css=input[name="nome-social-0"]


${CAMPO_DATA_NASCIMENTO}
...    css=input[placeholder="Insira data de nascimento"]


${CAMPO_EMAIL}
...    css=input[placeholder="Insira seu E-mail"]



${SELECT_DOCUMENTO}
...    xpath=//select[@aria-label="Tipo de documento"]



${CAMPO_NUMERO_DOCUMENTO}
...    css=input[placeholder="Número do documento"]


${CAMPO_CPF}
...    css=input[placeholder="Insira o CPF"]


${CAMPO_TELEFONE}
...    css=input[placeholder="Insira seu telefone"]



${SELECT_NECESSIDADE_ESPECIAL}
...    xpath=//select[@id="necessidade-especial-0"]



${BTN_SEGUIR_PAGAMENTO}
...    xpath=(//button[contains(normalize-space(.),"Seguir para Pagamento") and not(@disabled)])[1]



# ==========================
# Massa de dados
# ==========================

${NOME_PASSAGEIRO}
...    Rafael Alves Breder


${NOME_SOCIAL}
...    Rafael


${DATA_NASCIMENTO}
...    01/01/1950


${EMAIL}
...    rafael@email.com


${DOCUMENTO}
...    14651651


${CPF}
...    10193395606


${TELEFONE}
...    33984044879


${TIPO_DOCUMENTO}
...    RG


*** Keywords ***

Fechar Modal De Boas Vindas

    Wait For Elements State
    ...    ${BTN_MODAL_OK}
    ...    visible
    ...    timeout=15s

    Click
    ...    ${BTN_MODAL_OK}



Preencher Campos de Viagem

    ####################################################
    ## Limpar seleção
    ####################################################

    Wait For Elements State
    ...    ${BTN_LIMPAR_SELECOES}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${BTN_LIMPAR_SELECOES}


    Sleep
    ...    2s



    ####################################################
    ## SÓ IDA
    ####################################################

    Wait For Elements State
    ...    ${BTN_VIAGEM_SO_IDA}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${BTN_VIAGEM_SO_IDA}


    Sleep
    ...    3s



    ####################################################
    ## Ferrovia
    ####################################################

    Wait For Elements State
    ...    ${OPCAO_FERROVIA_EFC}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${OPCAO_FERROVIA_EFC}


    Sleep
    ...    2s



    ####################################################
    ## Origem
    ####################################################

    Click
    ...    ${CAMPO_ORIGEM}


    Wait For Elements State
    ...    ${CIDADE_ORIGEM}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${CIDADE_ORIGEM}



    ####################################################
    ## Destino
    ####################################################

    Click
    ...    ${CAMPO_DESTINO}


    Wait For Elements State
    ...    ${CIDADE_DESTINO}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${CIDADE_DESTINO}



    ####################################################
    ## Data disponível
    ####################################################

    Click
    ...    ${CAMPO_DATA}


    Wait For Elements State
    ...    ${DATA_ESCOLHIDA}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${DATA_ESCOLHIDA}


    Sleep
    ...    3s



    ####################################################
    ## Tipo de passagem
    ####################################################

    Wait For Elements State
    ...    ${BTN_TIPO_PASSAGEM}
    ...    enabled
    ...    timeout=60s


    Click
    ...    ${BTN_TIPO_PASSAGEM}



    Wait For Elements State
    ...    ${OPCAO_TARIFA_NORMAL}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${OPCAO_TARIFA_NORMAL}



    ####################################################
    ## Passageiro
    ####################################################

    Wait For Elements State
    ...    ${BTN_MAIS_ADULTO}
    ...    enabled
    ...    timeout=30s


    Click
    ...    ${BTN_MAIS_ADULTO}



    Wait For Elements State
    ...    ${BTN_CONFIRMAR_PASSAGEIROS}
    ...    enabled
    ...    timeout=30s


    Click
    ...    ${BTN_CONFIRMAR_PASSAGEIROS}



    ####################################################
    ## Seguir para escolha de assentos
    ####################################################

    Wait For Elements State
    ...    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}
    ...    enabled
    ...    timeout=60s


    Click
    ...    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}


    Sleep
    ...    5s



    ####################################################
    ## Concordar com os termos apresentados
    ####################################################

    Wait For Elements State
    ...    ${BTN_CONCORDAR_TERMOS}
    ...    visible
    ...    timeout=60s


    Click
    ...    ${BTN_CONCORDAR_TERMOS}


    Sleep
    ...    5s



    ####################################################
    ## Aguardar tela de poltronas carregar
    ####################################################

    Wait For Elements State
    ...    ${PRIMEIRO_ASSENTO_DISPONIVEL}
    ...    visible
    ...    timeout=120s



    ####################################################
    ## Primeiro assento
    ####################################################

    Wait For Elements State
    ...    ${PRIMEIRO_ASSENTO_DISPONIVEL}
    ...    visible
    ...    timeout=60s


    Click
    ...    ${PRIMEIRO_ASSENTO_DISPONIVEL}


    Sleep
    ...    10s



    ####################################################
    ## Dados passageiro
    ####################################################



    ####################################################
    ## Nome completo
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_NOME}
    ...    visible
    ...    timeout=120s


    Fill Text
    ...    ${CAMPO_NOME}
    ...    ${NOME_PASSAGEIRO}


    Sleep
    ...    2s



    ####################################################
    ## Nome social
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_NOME_SOCIAL}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_NOME_SOCIAL}
    ...    ${NOME_SOCIAL}


    Sleep
    ...    2s



    ####################################################
    ## Data nascimento
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_DATA_NASCIMENTO}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_DATA_NASCIMENTO}
    ...    ${DATA_NASCIMENTO}


    Sleep
    ...    2s



    ####################################################
    ## Email
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_EMAIL}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_EMAIL}
    ...    ${EMAIL}


    Sleep
    ...    2s



    ####################################################
    ## Documento
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_NUMERO_DOCUMENTO}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_NUMERO_DOCUMENTO}
    ...    ${DOCUMENTO}


    Sleep
    ...    2s



    ####################################################
    ## CPF
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_CPF}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_CPF}
    ...    ${CPF}


    Sleep
    ...    2s



    ####################################################
    ## Telefone
    ####################################################

    Wait For Elements State
    ...    ${CAMPO_TELEFONE}
    ...    visible
    ...    timeout=30s


    Fill Text
    ...    ${CAMPO_TELEFONE}
    ...    ${TELEFONE}


    Sleep
    ...    3s



    ####################################################
    ## Seguir pagamento
    ####################################################

    Wait For Elements State
    ...    ${BTN_SEGUIR_PAGAMENTO}
    ...    enabled
    ...    timeout=60s


    Click
    ...    ${BTN_SEGUIR_PAGAMENTO}


    Sleep
    ...    10s