*** Settings ***
Library    Browser

*** Variables ***
${MODAL_OK_BTN}        button >> text=Ok
${VIAGEM_SO_IDA_RADIO}    //*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[2]/div
${VIAGEM_IDA_E_VOLTA_RADIO}    //*[@id="root"]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/div 
${FERROVIA_EFC_RADIO}    //*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[2]/div[1]/div
${FERROVIA_EFVM_RADIO}    //*[@id="root"]/div[3]/div/div[2]/div/div[2]/div[2]/div[2]/div
${ORIGEM_RADIO}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[1]/div[1]/div[1]
${CIDADE_SL_RADIO}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[1]/div[1]/div[2]/div[2]/div[1]
${DESTINO_RADIO}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[1]/div[2]/div[1]
${CIDADE_ARARI_RADIO}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[1]/div[2]/div[2]/div[2]/div[2]
${DATA_DT}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[2]/div/div[1]       
${TOTAL_DE_PASSAGENS_RADIO}    //*[@id="root"]/div[3]/div/div[3]/div[2]/div[1]/div[3]/div/div[1]
${LIMPAR_SELEÇÕES_RADIO}    //*[@id="root"]/div[3]/div/div[5]/button
${SEGUIR_PARA_ESCOLHA_DE_ASSENTOS_RADIO}    //*[@id="root"]/div[3]/div/div[5]/span    


*** Keywords ***
Fechar Modal De Boas Vindas
    Click    ${MODAL_OK_BTN}

Preencher Campos de Viagem
    Click    ${VIAGEM_SO_IDA_RADIO}
    Click    ${FERROVIA_EFC_RADIO}
    Click    ${ORIGEM_RADIO}
    Click    ${CIDADE_SL_RADIO}    
    Click    ${DESTINO_RADIO}
    Click    ${CIDADE_ARARI_RADIO}    
    Click    ${DATA_DT}    
    Click    ${TOTAL_DE_PASSAGENS_RADIO}
    Click    ${LIMPAR_SELEÇÕES_RADIO}
    Click    ${SEGUIR_PARA_ESCOLHA_DE_ASSENTOS_RADIO}



    