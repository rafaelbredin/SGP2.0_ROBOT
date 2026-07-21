*** Settings ***
Resource    LoginPage.resource
Resource    CancelarPassagemPage.resource
Resource    PagamentoPage.resource


*** Keywords ***

Fluxo Completo De Cancelamento
    Abrir Sistema
    Fazer Login
    Ir Para Consultar Passagens
    Abrir Detalhes De Passagem Cancelavel

    ${localizador}=    Capturar Localizador Da Passagem

    Iniciar Cancelamento
    Selecionar Justificativa - Motivos Pessoais
    Confirmar Cancelamento
    Preencher Dados Do Cartao De Teste
    Confirmar Pagamento
    Take Screenshot    EOF
    Validar Retorno Para Minhas Viagens
    Validar Status Cancelado    ${localizador}