*** Settings ***
Library    Browser

*** Variables ***
${MODAL_OK_BTN}        button >> text=Ok
${ENTRAR_BTN}          button >> text=Entrar
${EMAIL_INPUT}         id=signInName
${PASSWORD_INPUT}      id=password
${SUBMIT_BTN}          id=next
${COMPRA_HEADING}      text=Compra de Passagens

*** Keywords ***
Fechar Modal De Boas Vindas
    Click    ${MODAL_OK_BTN}

Abrir Formulario De Login
    Click    ${ENTRAR_BTN}

Preencher Credenciais
    [Arguments]    ${email}    ${password}
    Fill Text      ${EMAIL_INPUT}      ${email}
    Fill Text      ${PASSWORD_INPUT}   ${password}

Submeter Login
    Click    ${SUBMIT_BTN}

Fazer Login
    [Arguments]    ${email}    ${password}
    Fechar Modal De Boas Vindas
    Abrir Formulario De Login
    Preencher Credenciais    ${email}    ${password}
    Submeter Login
    