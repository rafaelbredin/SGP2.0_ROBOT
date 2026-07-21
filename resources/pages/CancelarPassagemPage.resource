*** Settings ***
Library    Browser
Library    String
Library    Collections


*** Variables ***

# --- Menu lateral ---
${BTN_MENU_LATERAL}                 xpath=//img[@alt="Abrir menu lateral"]
${OPCAO_CONSULTAR_PASSAGENS}        xpath=//span[normalize-space(.)="Consultar Passagens"]

# --- Tela "Minhas Viagens" ---
${CAMPO_LOCALIZADOR}                xpath=//input[@placeholder="Localizador ou Nº Bilhete"]
${BTN_BUSCAR}                       xpath=//button[normalize-space(.)="Buscar"]
${TITULO_MINHAS_VIAGENS}            xpath=//h1[normalize-space(.)="Minhas Viagens" or contains(normalize-space(.),"Minhas Viagens")]

# --- Tela de Detalhes da Passagem ---
${BTN_CANCELAR}                     xpath=//span[normalize-space(.)="Cancelar"]
${LOCALIZADOR_EXIBIDO}              xpath=//span[contains(@class,"sc-iYrLis") and starts-with(normalize-space(text()),"SGP")]

# --- Tela de Cancelamento - Justificativa (react-select customizado) ---
${INPUT_JUSTIFICATIVA}              xpath=//input[@id="justificativa-cancelamento"]
${OPCAO_JUSTIFICATIVA_PESSOAL}      xpath=//*[normalize-space(text())="Desistência por motivos pessoais"]
${BTN_CONFIRMAR_CANCELAMENTO}       xpath=//button[contains(normalize-space(.),"Confirmar Cancelamento de Passagens")]


*** Keywords ***

# ==========================================================
# Navegação
# ==========================================================

Abrir Menu Lateral
    Wait For Elements State    ${BTN_MENU_LATERAL}    visible    timeout=30s
    Click                      ${BTN_MENU_LATERAL}
    Sleep                      1s


Ir Para Consultar Passagens
    Abrir Menu Lateral

    Wait For Elements State    ${OPCAO_CONSULTAR_PASSAGENS}    visible    timeout=30s
    Click                      ${OPCAO_CONSULTAR_PASSAGENS}

    Wait For Elements State    ${CAMPO_LOCALIZADOR}    visible    timeout=30s
    Sleep                      2s


# ==========================================================
# Busca / Listagem de passagens
# ==========================================================

Buscar Passagem Por Localizador
    [Arguments]    ${localizador}

    Fill Text    ${CAMPO_LOCALIZADOR}    ${localizador}
    Click        ${BTN_BUSCAR}
    Sleep        2s


Abrir Detalhes Da Primeira Passagem Disponivel
    ${xpath_botao}=    Set Variable
    ...    xpath=(//button[@title="Ver detalhes" and not(@disabled)])[1]

    Wait For Elements State    ${xpath_botao}    visible    timeout=30s
    Click                      ${xpath_botao}

    Wait For Elements State    ${BTN_CANCELAR}    visible    timeout=30s


Abrir Detalhes De Passagem Cancelavel
    [Documentation]    Percorre a listagem de passagens (até 10 tentativas) procurando
    ...                a primeira cuja tela de detalhes tenha o botão "Cancelar" habilitado.
    ...                Se a passagem atual não puder ser cancelada, volta para a listagem
    ...                (via URL) e tenta a próxima.

    FOR    ${indice}    IN RANGE    1    11

        # Garante que a listagem já carregou pelo menos um botão habilitado
        Wait For Elements State
        ...    xpath=(//button[@title="Ver detalhes" and not(@disabled)])[1]
        ...    visible    timeout=20s

        ${xpath_botao}=    Set Variable
        ...    xpath=(//button[@title="Ver detalhes" and not(@disabled)])[${indice}]

        ${existe}=    Get Element Count    ${xpath_botao}
        Log To Console    TENTATIVA ${indice} - Botoes disponiveis encontrados: ${existe}

        IF    ${existe} == 0
            BREAK
        END

        Click    ${xpath_botao}
        Wait For Elements State    ${BTN_CANCELAR}    visible    timeout=15s

        ${estados}=    Get Element States    ${BTN_CANCELAR}
        ${desabilitado}=    Evaluate    'disabled' in $estados

        Log To Console    TENTATIVA ${indice} - Cancelar desabilitado? ${desabilitado}

        IF    not ${desabilitado}
            RETURN
        END

        # Passagem atual não pode ser cancelada -> volta para a listagem e tenta a próxima
        Go To    https://tremdepassageiros-pv-qa.valeglobal.net/travels
        Wait For Elements State    ${CAMPO_LOCALIZADOR}    visible    timeout=15s
        Sleep    2s

    END

    Fail    Nenhuma passagem com Cancelar habilitado foi encontrada


Capturar Localizador Da Passagem
    Wait For Elements State    ${LOCALIZADOR_EXIBIDO}    visible    timeout=15s

    ${localizador}=    Get Text    ${LOCALIZADOR_EXIBIDO}

    Log To Console    LOCALIZADOR CAPTURADO: ${localizador}

    RETURN    ${localizador}


# ==========================================================
# Fluxo de Cancelamento
# ==========================================================

Iniciar Cancelamento
    Click    ${BTN_CANCELAR}
    Sleep    2s


Selecionar Justificativa - Motivos Pessoais
    Wait For Elements State    ${INPUT_JUSTIFICATIVA}    attached    timeout=30s
    Evaluate JavaScript         ${INPUT_JUSTIFICATIVA}
    ...    (element) => element.dispatchEvent(new MouseEvent('mousedown', {bubbles: true}))

    Wait For Elements State    ${OPCAO_JUSTIFICATIVA_PESSOAL}    visible    timeout=15s
    Click                      ${OPCAO_JUSTIFICATIVA_PESSOAL}

    Sleep    1s


Confirmar Cancelamento
    Wait For Elements State    ${BTN_CONFIRMAR_CANCELAMENTO}    enabled    timeout=30s
    Click                      ${BTN_CONFIRMAR_CANCELAMENTO}
    Sleep    5s


# ==========================================================
# Validações pós-cancelamento
# ==========================================================

Validar Retorno Para Minhas Viagens
    Wait For Elements State    ${TITULO_MINHAS_VIAGENS}    visible    timeout=60s

    ${url}=    Get Url
    Should Contain    ${url}    /travels


Validar Status Cancelado
    [Arguments]    ${localizador}

    ${xpath_linha}=    Set Variable
    ...    xpath=(//div[normalize-space(text())="${localizador}"]/parent::div)[1]

    Wait For Elements State    ${xpath_linha}    visible    timeout=30s

    ${status}=    Get Text    ${xpath_linha}

    Log To Console    STATUS APÓS CANCELAMENTO: ${status}

    Should Contain    ${status}    Cancel
