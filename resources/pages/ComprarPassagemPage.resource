*** Settings ***
Library    Browser
Library    String
Library    Collections


*** Variables ***

# Modal
${BTN_MODAL_OK}                     xpath=(//button[normalize-space(.)="Ok"])[1]

# Tipo de viagem
${BTN_VIAGEM_IDA_VOLTA}             xpath=//*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div

# Ferrovia
${OPCAO_FERROVIA_EFC}               xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro de Carajás (EFC)"])[last()]
${OPCAO_FERROVIA_EFVM}              xpath=(//*[@id="root"]//*[normalize-space(.)="Estrada de Ferro Vitória-Minas (EFVM)"])[last()]

# Origem / Destino
${CAMPO_ORIGEM}                     xpath=(//div[contains(@class,"sc-iEqALP")])[1]
${CAMPO_DESTINO}                    xpath=(//div[contains(@class,"sc-iEqALP")])[2]

${CIDADE_ORIGEM}                    xpath=(//*[normalize-space(.)="São Luis" or normalize-space(.)="São Luís"])[last()]
${CIDADE_DESTINO}                   xpath=(//*[normalize-space(.)="Arari"])[last()]


# Datas
${CAMPO_DATA}                       xpath=(//button[.//span[contains(normalize-space(.),"Selecione")]])[1]

${DATA_ESCOLHIDA}                   xpath=(//div[@role="option" and @aria-disabled="false" and contains(@class,"react-datepicker__day") and not(contains(@class,"outside-month"))])[1]


# Data volta
${CAMPO_DATA_VOLTA}                 xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div[1]/div[2]/div/div[2]/div[2]/div/div/button/span[1]

${DATA_VOLTA_DISPONIVEL}            xpath=(//*[@id="root"]//div[@role="option" and @aria-disabled="false" and contains(@class,"react-datepicker__day")])[last()]


# Tipo de passagem
${BTN_TIPO_PASSAGEM}                xpath=(//button[contains(normalize-space(.),"Tipos de Passagem") and not(@disabled)])[1]

${BTN_TIPO_PASSAGEM_VOLTA}          xpath=//*[@id="root"]/div[3]/div/div[4]/div[2]/div[1]/div[3]/div/div[2]/div/div/button/span[2]

${OPCAO_TARIFA_NORMAL}              xpath=//div[@title="Tarifa Normal"]


# Passageiros
${BTN_MAIS_ADULTO}                  xpath=//div[@role="group" and @aria-label="Tarifa Normal"]//button[last()]

${BTN_CONFIRMAR_PASSAGEIROS}        xpath=(//button[contains(normalize-space(.),"Confirmar") and not(@disabled)])[last()]

${BTN_CONFIRMAR_PASSAGEIROS_VOLTA}  xpath=(//button[.//span[normalize-space(.)="Confirmar"]])[last()]


# Limpar seleção
${BTN_LIMPAR_SELECOES}              xpath=(//button[contains(normalize-space(.),"Limpar Seleções")])[1]


# Escolha de assentos
${BTN_SEGUIR_ESCOLHA_ASSENTOS}      xpath=//button[contains(normalize-space(.),"Escolher assentos") or contains(normalize-space(.),"Seguir para Escolha de Assentos")]
${BTN_CONCORDAR_TERMOS}             xpath=//*[@id="root"]/div[3]/div[2]/div/div[3]/button[2]

${PRIMEIRO_ASSENTO_DISPONIVEL}      xpath=(//span[@role="button" and @tabindex="0"])[1]


# Dados passageiro
${CAMPO_NOME_IDA}                   css=input[name="nome-completo-0-ida"]

${CAMPO_NOME_VOLTA}                 css=input[name="nome-completo-0-volta"]

${CAMPO_NOME_SOCIAL_IDA}            xpath=(//input[@name="nome-social-0"])[1]

${CAMPO_NOME_SOCIAL_VOLTA}          xpath=(//input[@name="nome-social-0"])[2]

${CAMPO_DATA_NASCIMENTO_IDA}        xpath=(//input[@placeholder="Insira data de nascimento"])[1]

${CAMPO_DATA_NASCIMENTO_VOLTA}      xpath=(//input[@placeholder="Insira data de nascimento"])[2]

${CAMPO_EMAIL_IDA}                  xpath=(//input[@placeholder="Insira seu E-mail"])[1]

${CAMPO_EMAIL_VOLTA}                xpath=(//input[@placeholder="Insira seu E-mail"])[2]

${SELECT_DOCUMENTO_IDA}             xpath=(//select[@aria-label="Tipo de documento"])[1]

${SELECT_DOCUMENTO_VOLTA}           xpath=(//select[@aria-label="Tipo de documento"])[2]

${CAMPO_NUMERO_DOCUMENTO_IDA}       xpath=(//input[@aria-label="Número do documento"])[1]

${ASSENTO_IDA}                      xpath=//*[@id="root"]/div[3]/div[2]/div[6]/div[2]/div[2]/div[2]/div/div[2]/div[9]/div[1]/button[2]/span[1]

${ASSENTO_VOLTA}                    xpath=//*[@id="root"]/div[3]/div[2]/div[6]/div[5]/div[2]/div[3]/div/div[2]/div[10]/div[2]/button[1]/span[1]

${CAMPO_NUMERO_DOCUMENTO_VOLTA}     xpath=(//input[@aria-label="Número do documento"])[2]

${CAMPO_CPF_IDA}                    xpath=(//input[@placeholder="Insira o CPF"])[1]

${CAMPO_CPF_VOLTA}                  xpath=(//input[@placeholder="Insira o CPF"])[2]

${CAMPO_TELEFONE_IDA}               xpath=(//input[@placeholder="Insira seu telefone"])[1]

${CAMPO_TELEFONE_VOLTA}             xpath=(//input[@placeholder="Insira seu telefone"])[2]

${SELECT_NECESSIDADE_ESPECIAL_IDA}  xpath=(//select[@id="necessidade-especial-0"])[1]

${SELECT_NECESSIDADE_ESPECIAL_VOL}  xpath=(//select[@id="necessidade-especial-0"])[2]

${BTN_SEGUIR_PAGAMENTO}             xpath=(//button[contains(normalize-space(.),"Seguir para Pagamento")])[1]

${CONFIRMAR_COMPRA}                 xpath=//button[contains(normalize-space(.),"Gerar passagem")]

${BTN_CONFIRMAR_SAFRAPAY}           xpath=//button[contains(@class,"confirmation-btn") and normalize-space(.)="Confirmar"]

# Massa dados
${NOME_SOCIAL}                      Teste

${DATA_NASCIMENTO}                  01/01/1970

${RG}                               15875698422

${CPF}                              59950907128

${TELEFONE}                         33984044879

${NOME_PASSAGEIRO}                  RF AUTOMAÇÃO 256465

${EMAIL}                            teste@gmail.com



# Pagamento
${PREENCHER_DADOS_PAGAMENTO}        xpath=//*[@id="card_number"]

${PREENCHER_DADOS_PAGAMENTO_ID}     xpath=//*[@id="card_validity"]

${PREENCHER_DADOS_PAGAMENTO_CVV}    xpath=//*[@id="card_cvv"]

${PREENCHER_DADOS_PAGAMENTO_NAME}   xpath=//*[@id="card_name"]

${CARTAO_TESTE}                     5502 0937 6992 1690

${VALIDADE_TESTE}                   12/30

${CVV_TESTE}                        123

${NOME_CARTAO_TESTE}                CLIENTE TESTE


# Finalização
${FINALIZAR_PAGAMENTO}              xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[2]/div[1]/div[1]/div[2]/button

${CONTINUAR_PAGINA}                 xpath=//*[@id="app"]/div[2]/div[2]/div[2]/div/div[3]/div/div/div/button

${VALIDAR_PAGINA}                   xpath=//body

${FECHAR_MODAL}                     xpath=//*[@id="radix-:r3:"]/button/span



*** Keywords ***


Fechar Modal De Boas Vindas
    Wait For Elements State    ${BTN_MODAL_OK}    visible    timeout=15s
    Click                      ${BTN_MODAL_OK}



Limpar Selecoes
    Wait For Elements State    ${BTN_LIMPAR_SELECOES}    visible    timeout=30s
    Click                      ${BTN_LIMPAR_SELECOES}
    Sleep                      2s



Selecionar Tipo de Viagem - Ida e Volta
    Wait For Elements State    ${BTN_VIAGEM_IDA_VOLTA}    visible    timeout=30s
    Click                      ${BTN_VIAGEM_IDA_VOLTA}
    Sleep                      2s



Selecionar Ferrovia - EFC
    Wait For Elements State    ${OPCAO_FERROVIA_EFC}    visible    timeout=30s
    Click                      ${OPCAO_FERROVIA_EFC}
    Sleep                      2s



Selecionar Origem e Destino
    Click                      ${CAMPO_ORIGEM}

    Wait For Elements State    ${CIDADE_ORIGEM}    visible    timeout=30s

    Click                      ${CIDADE_ORIGEM}


    Click                      ${CAMPO_DESTINO}

    Wait For Elements State    ${CIDADE_DESTINO}    visible    timeout=30s

    Click                      ${CIDADE_DESTINO}



Selecionar Data da Viagem

    Wait For Elements State
    ...    ${CAMPO_DATA}
    ...    visible
    ...    timeout=30s


    Scroll To Element
    ...    ${CAMPO_DATA}


    Sleep    2s


    Click
    ...    ${CAMPO_DATA}


    Wait For Elements State
    ...    ${DATA_ESCOLHIDA}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${DATA_ESCOLHIDA}


    Sleep    3s


    Wait For Elements State
    ...    ${CAMPO_DATA_VOLTA}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${CAMPO_DATA_VOLTA}


    Wait For Elements State
    ...    ${DATA_VOLTA_DISPONIVEL}
    ...    visible
    ...    timeout=30s


    Click
    ...    ${DATA_VOLTA_DISPONIVEL}


    Sleep    3s
    
Selecionar Tipo de Passagem - Tarifa Normal
    Wait For Elements State    ${BTN_TIPO_PASSAGEM}    enabled    timeout=60s
    Click                      ${BTN_TIPO_PASSAGEM}


    Wait For Elements State    ${OPCAO_TARIFA_NORMAL}    visible    timeout=30s
    Click                      ${OPCAO_TARIFA_NORMAL}


    Wait For Elements State    ${BTN_MAIS_ADULTO}    enabled    timeout=30s
    Click                      ${BTN_MAIS_ADULTO}


    Wait For Elements State    ${BTN_CONFIRMAR_PASSAGEIROS}    enabled    timeout=30s
    Click                      ${BTN_CONFIRMAR_PASSAGEIROS}


    Wait For Elements State    ${BTN_CONFIRMAR_PASSAGEIROS}    hidden    timeout=30s



Selecionar Tipo de Passagem - Tarifa Normal - Volta
    Wait For Elements State    ${BTN_TIPO_PASSAGEM_VOLTA}    enabled    timeout=60s

    Scroll To Element          ${BTN_TIPO_PASSAGEM_VOLTA}

    Click                      ${BTN_TIPO_PASSAGEM_VOLTA}


    Wait For Elements State    ${OPCAO_TARIFA_NORMAL}    visible    timeout=30s

    Click                      ${OPCAO_TARIFA_NORMAL}


    Wait For Elements State    ${BTN_MAIS_ADULTO}    enabled    timeout=30s

    Click                      ${BTN_MAIS_ADULTO}


    Wait For Elements State    ${BTN_CONFIRMAR_PASSAGEIROS_VOLTA}    visible    timeout=30s

    Click                      ${BTN_CONFIRMAR_PASSAGEIROS_VOLTA}


    Wait For Elements State    ${BTN_CONFIRMAR_PASSAGEIROS_VOLTA}    hidden    timeout=30s


Seguir Para a Escolha de Assentos

    Wait For Elements State
    ...    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}
    ...    visible
    ...    timeout=120s

    Scroll To Element
    ...    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}

    Click
    ...    ${BTN_SEGUIR_ESCOLHA_ASSENTOS}

    Sleep    5s


    Wait For Elements State
    ...    ${BTN_CONCORDAR_TERMOS}
    ...    visible
    ...    timeout=60s


    Click
    ...    ${BTN_CONCORDAR_TERMOS}


    Sleep    5s


Selecionar Assento Disponivel

    Wait For Elements State
    ...    xpath=//span[@aria-current="page" and contains(normalize-space(.),"Ida")]
    ...    visible
    ...    timeout=60s

    Click
    ...    xpath=(//span[@aria-current="page" and contains(normalize-space(.),"Ida")]/following::span[@role="button" and @tabindex="0"])[1]

    Sleep    10s


Selecionar Assento Volta

    Wait For Elements State
    ...    xpath=//span[@aria-current="page" and normalize-space(.)="Escolha de assentos: Volta"]
    ...    visible
    ...    timeout=60s

    Sleep    2s

    ${assentos_volta}=    Get Elements
    ...    xpath=(//span[@aria-current="page" and normalize-space(.)="Escolha de assentos: Volta"]/following::span[@role="button" and @tabindex="0"])

    ${qtd}=    Get Length
    ...    ${assentos_volta}

    Log To Console
    ...    ASSENTOS VOLTA LIVRES: ${qtd}

    Click
    ...    ${assentos_volta}[0]

    Sleep    3s

Preencher Campos de Viagem - Ida e Volta - EFC - Tarifa Normal

    Limpar Selecoes

    Selecionar Tipo de Viagem - Ida e Volta

    Selecionar Ferrovia - EFC

    Selecionar Origem e Destino

    Selecionar Data da Viagem

    Selecionar Tipo de Passagem - Tarifa Normal

    Selecionar Tipo de Passagem - Tarifa Normal - Volta

    Seguir Para a Escolha de Assentos

    Selecionar Assento Disponivel

    Preencher Dados do Passageiro

    Selecionar Assento Volta
    
    Preencher Documento

    Preencher Dados Complementares

Gerar Massa De Dados Aleatoria
    ${numero}=    Evaluate    random.randint(10000,99999)    random

    ${nome}=      Set Variable    RF AUTOMACAO ${numero}


    ${email}=     Evaluate    ''.join(random.choice('abcdefghijklmnopqrstuvwxyz') for _ in range(12)) + '@gmail.com'    random


    ${rg}=        Evaluate    str(random.randint(100000000,99999999999))    random


    Set Test Variable    ${NOME_PASSAGEIRO}    ${nome}

    Set Test Variable    ${EMAIL}              ${email}

    Set Test Variable    ${RG}                 ${rg}


Preencher Dados do Passageiro

    Wait For Elements State
    ...    ${CAMPO_NOME_IDA}
    ...    visible
    ...    timeout=120s

    Fill Text
    ...    ${CAMPO_NOME_IDA}
    ...    ${NOME_PASSAGEIRO}

    Wait For Elements State
    ...    ${CAMPO_NOME_VOLTA}
    ...    visible
    ...    timeout=120s

    Fill Text
    ...    ${CAMPO_NOME_VOLTA}
    ...    ${NOME_PASSAGEIRO}

    Log To Console    NOMES PREENCHIDOS

Preencher Dados Complementares

    Wait For Elements State
    ...    ${CAMPO_NOME_SOCIAL_IDA}
    ...    visible
    ...    timeout=60s


    Fill Text
    ...    ${CAMPO_NOME_SOCIAL_IDA}
    ...    ${NOME_SOCIAL}


    Fill Text
    ...    ${CAMPO_DATA_NASCIMENTO_IDA}
    ...    ${DATA_NASCIMENTO}


    Fill Text
    ...    ${CAMPO_DATA_NASCIMENTO_VOLTA}
    ...    ${DATA_NASCIMENTO}


    Fill Text
    ...    ${CAMPO_EMAIL_IDA}
    ...    ${EMAIL}


    Fill Text
    ...    ${CAMPO_EMAIL_VOLTA}
    ...    ${EMAIL}

Preencher Documento

    Log To Console    INICIANDO RG IDA


    Select Options By
    ...    ${SELECT_DOCUMENTO_IDA}
    ...    label
    ...    RG


    Sleep    3s


    Wait For Elements State
    ...    ${CAMPO_NUMERO_DOCUMENTO_IDA}
    ...    visible
    ...    timeout=120s


    Log To Console    CAMPO RG IDA ENCONTRADO


    Fill Text
    ...    ${CAMPO_NUMERO_DOCUMENTO_IDA}
    ...    ${RG}


    Log To Console    RG IDA PREENCHIDO



    Log To Console    INICIANDO RG VOLTA


    Select Options By
    ...    ${SELECT_DOCUMENTO_VOLTA}
    ...    label
    ...    RG


    Sleep    3s


    Wait For Elements State
    ...    ${CAMPO_NUMERO_DOCUMENTO_VOLTA}
    ...    visible
    ...    timeout=120s


    Log To Console    CAMPO RG VOLTA ENCONTRADO


    Fill Text
    ...    ${CAMPO_NUMERO_DOCUMENTO_VOLTA}
    ...    ${RG}


    Log To Console    RG VOLTA PREENCHIDO



    ${cpfs}=    Get Elements
    ...    xpath=//input[@placeholder="Insira o CPF"]


    ${qtd}=    Get Length    ${cpfs}


    Log To Console    QTD CPF: ${qtd}


       Wait For Elements State
    ...    ${CAMPO_CPF_IDA}
    ...    visible
    ...    timeout=60s

    Click
    ...    ${CAMPO_CPF_IDA}

    Fill Text
    ...    ${CAMPO_CPF_IDA}
    ...    ${CPF}

    ${cpf_ida}=    Get Attribute
    ...    ${CAMPO_CPF_IDA}
    ...    value

    Log To Console    CPF IDA: ${cpf_ida}

    Wait For Elements State
    ...    ${CAMPO_CPF_VOLTA}
    ...    visible
    ...    timeout=60s

    Click
    ...    ${CAMPO_CPF_VOLTA}

    Fill Text
    ...    ${CAMPO_CPF_VOLTA}
    ...    ${CPF}

    ${cpf_volta}=    Get Attribute
    ...    ${CAMPO_CPF_VOLTA}
    ...    value

    Log To Console    CPF VOLTA: ${cpf_volta}

    Scroll To Element
    ...    ${CAMPO_CPF_VOLTA}

    Sleep    3s



    Fill Text
    ...    ${CAMPO_TELEFONE_IDA}
    ...    ${TELEFONE}


    Fill Text
    ...    ${CAMPO_TELEFONE_VOLTA}
    ...    ${TELEFONE}


    Fill Text
    ...    ${CAMPO_EMAIL_IDA}
    ...    ${EMAIL}


    Fill Text
    ...    ${CAMPO_EMAIL_VOLTA}
    ...    ${EMAIL}


    Log To Console    DOCUMENTOS E DADOS COMPLETOS


Validar Campos Preenchidos

    Wait For Elements State
    ...    ${BTN_SEGUIR_PAGAMENTO}
    ...    visible
    ...    timeout=60s

    Log    Botão pagamento encontrado


Seguir Para Pagamento

    ${disabled}=    Get Property
    ...    ${BTN_SEGUIR_PAGAMENTO}
    ...    disabled

    ${classe}=    Get Attribute
    ...    ${BTN_SEGUIR_PAGAMENTO}
    ...    class

    Log To Console    DISABLED: ${disabled}
    Log To Console    CLASS: ${classe}


    Run Keyword If
    ...    ${disabled} == ${True}
    ...    Verificar Campos Vazios


    Wait For Elements State
    ...    ${BTN_SEGUIR_PAGAMENTO}
    ...    enabled
    ...    timeout=120s


    Click
    ...    ${BTN_SEGUIR_PAGAMENTO}

Verificar Campos Vazios

    ${nome_ida}=    Get Attribute
    ...    ${CAMPO_NOME_IDA}
    ...    value

    ${nome_volta}=    Get Attribute
    ...    ${CAMPO_NOME_VOLTA}
    ...    value


    ${rg_ida}=    Get Attribute
    ...    ${CAMPO_NUMERO_DOCUMENTO_IDA}
    ...    value

    ${rg_volta}=    Get Attribute
    ...    ${CAMPO_NUMERO_DOCUMENTO_VOLTA}
    ...    value


    ${cpf_ida}=    Get Attribute
    ...    ${CAMPO_CPF_IDA}
    ...    value

    ${cpf_volta}=    Get Attribute
    ...    ${CAMPO_CPF_VOLTA}
    ...    value


    ${email_ida}=    Get Attribute
    ...    ${CAMPO_EMAIL_IDA}
    ...    value

    ${email_volta}=    Get Attribute
    ...    ${CAMPO_EMAIL_VOLTA}
    ...    value


    Log To Console    NOME IDA: ${nome_ida}
    Log To Console    NOME VOLTA: ${nome_volta}

    Log To Console    RG IDA: ${rg_ida}
    Log To Console    RG VOLTA: ${rg_volta}

    Log To Console    CPF IDA: ${cpf_ida}
    Log To Console    CPF VOLTA: ${cpf_volta}

    Log To Console    EMAIL IDA: ${email_ida}
    Log To Console    EMAIL VOLTA: ${email_volta}

Confirmar Compra
    Wait For Elements State    ${CONFIRMAR_COMPRA}    visible    timeout=60s

    Scroll To Element          ${CONFIRMAR_COMPRA}


    Click                      ${CONFIRMAR_COMPRA}


    Wait For Load State        networkidle


    Wait For Elements State    xpath=//body    visible    timeout=30s


    Sleep                      20s



Preencher Dados de Pagamento
    Log                        Iniciando preenchimento pagamento


    Wait For Elements State    ${PREENCHER_DADOS_PAGAMENTO}    visible    timeout=60s

    Click                      ${PREENCHER_DADOS_PAGAMENTO}

    Fill Text                  ${PREENCHER_DADOS_PAGAMENTO}    ${CARTAO_TESTE}


    Sleep                      3s


    Wait For Elements State    ${PREENCHER_DADOS_PAGAMENTO_ID}    visible    timeout=30s

    Click                      ${PREENCHER_DADOS_PAGAMENTO_ID}

    Fill Text                  ${PREENCHER_DADOS_PAGAMENTO_ID}    ${VALIDADE_TESTE}


    Sleep                      3s


    Wait For Elements State    ${PREENCHER_DADOS_PAGAMENTO_CVV}    visible    timeout=30s

    Click                      ${PREENCHER_DADOS_PAGAMENTO_CVV}

    Fill Text                  ${PREENCHER_DADOS_PAGAMENTO_CVV}    ${CVV_TESTE}


    Sleep                      3s


    Wait For Elements State    ${PREENCHER_DADOS_PAGAMENTO_NAME}    visible    timeout=30s

    Click                      ${PREENCHER_DADOS_PAGAMENTO_NAME}

    Fill Text                  ${PREENCHER_DADOS_PAGAMENTO_NAME}    ${NOME_CARTAO_TESTE}


    Sleep                      3s



Finalizar Pagamento
    Wait For Elements State    ${FINALIZAR_PAGAMENTO}    visible    timeout=60s

    Scroll To Element          ${FINALIZAR_PAGAMENTO}


    Sleep                      3s


    Click                      ${FINALIZAR_PAGAMENTO}


    Sleep                      10s


Confirmar Pagamento Safrapay
    Wait For Elements State    ${BTN_CONFIRMAR_SAFRAPAY}    visible    timeout=60s

    Scroll To Element          ${BTN_CONFIRMAR_SAFRAPAY}

    Click                      ${BTN_CONFIRMAR_SAFRAPAY}

    Sleep                      5s

    Wait For Load State        networkidle    timeout=60s


Validar Nova Pagina
    ${URL_ATUAL}=    Get Url

    Log    URL atual: ${URL_ATUAL}


    Wait For Elements State    xpath=//body    visible    timeout=60s



Continuar Na Pagina De Viagens
    Wait For Elements State    ${CONTINUAR_PAGINA}    visible    timeout=60s

    Scroll To Element          ${CONTINUAR_PAGINA}


    Click                      ${CONTINUAR_PAGINA}


    Sleep                      10s


    Sleep                      300s



Validar Proxima Pagina
    ${URL_ATUAL}=    Get Url

    Log    URL atual: ${URL_ATUAL}


    Wait For Elements State    ${VALIDAR_PAGINA}    visible    timeout=60s


    Should Contain             ${URL_ATUAL}    /travels



Fechar Modal PDF
    Wait For Elements State    ${FECHAR_MODAL}    visible    timeout=60s

    Click                      ${FECHAR_MODAL}


    Sleep                      3s