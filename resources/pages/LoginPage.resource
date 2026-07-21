*** Settings ***
Library    Browser


*** Variables ***
${URL_LOGIN}          https://tremdepassageiros-pv-qa.valeglobal.net/login
${EMAIL_LOGIN}        rafaelbreder10@gmail.com
${SENHA_LOGIN}        Vaisefude01@

${CAMPO_EMAIL}        id=signInName
${CAMPO_SENHA}        id=password
${BTN_ENTRAR}         id=next
${BTN_OK}             xpath=//button[normalize-space(.)="Ok"]
${BTN_ENTRAR_INICIAL}  xpath=//button[normalize-space(.)="Entrar"]

*** Keywords ***

Abrir Sistema
    New Browser    chromium    headless=False    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page       ${URL_LOGIN}
    Fechar Modal Inicial


Fechar Modal Inicial
    ${status}=    Run Keyword And Return Status
    ...    Wait For Elements State    ${BTN_OK}    visible    timeout=10s
    IF    ${status}
        Click    ${BTN_OK}
        Sleep    1s
    END


Fazer Login
    Wait For Elements State    ${BTN_ENTRAR_INICIAL}    visible    timeout=15s
    Click                       ${BTN_ENTRAR_INICIAL}
    Sleep                       2s

    Wait For Elements State    ${CAMPO_EMAIL}    visible    timeout=30s
    Fill Text                  ${CAMPO_EMAIL}    ${EMAIL_LOGIN}
    Fill Text                  ${CAMPO_SENHA}    ${SENHA_LOGIN}
    Click                      ${BTN_ENTRAR}
    Sleep                      3s