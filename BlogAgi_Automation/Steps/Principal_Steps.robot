#Este arquivo contém as implementações dos passos dos casos de teste do arquivo principal.
#Alguns detalhes sobre este arquivo:
#Quando faço a abertura do browser, procuro maximizar a tela para garantir que o botão de procura esteja sempre visível.
#As variáveis usadas para a massa de teste estão em um arquivo específico. Aqui, eu apenas faço o uso dessas variáveis. Outro detalhe é que a massa é carregada de um arquivo .json. Dessa forma, fica mais simples mudar a massa caso necessário.
#Optei por deixar a procura pelos XPath de forma dinâmica, ou seja, mesmo que mudemos o arquivo com a massa de dados, o teste sempre encontrará o que precisa.
#Criei um pequeno código em Python para fazer o carregamento das variáveis.

*** Settings ***
Resource    ../Elements/Principal_Elements.resource
Resource    ../Resource/Settings.resource
Library     ../Libraries/Util.py
Library    String


*** Keywords ***
Abrir Site
    Carregar massa de teste
    Open Browser    ${Configiguracao.url}    ${Configiguracao.browser}
    Maximize Browser Window
    
Fechar Site
    Close Browser

Carregar massa de teste
    ${nome_completo_materia_temp}    Retornar_valor_campo    ${massa_json}    nome_completo_materia
    Set Suite Variable    ${nome_completo_materia}   ${nome_completo_materia_temp} 

    ${nome_parcial_materia_temp}    Retornar_valor_campo    ${massa_json}    nome_parcial_materia
    Set Suite Variable    ${nome_parcial_materia}   ${nome_parcial_materia_temp} 

    ${nome_inexistente_materia_temp}    Retornar_valor_campo    ${massa_json}    nome_inexistente_materia
    Set Suite Variable    ${nome_inexistente_materia}   ${nome_inexistente_materia_temp} 

    ${mensagem_resultado_nao_encontrado_temp}    Retornar_valor_campo    ${massa_json}    mensagem_resultado_nao_encontrado
    Set Suite Variable    ${mensagem_resultado_nao_encontrado}   ${mensagem_resultado_nao_encontrado_temp} 

Dado que estou com o site Blog do Agi aberto
    Go To    ${Configiguracao.url}
    Wait Until Element Is Enabled    ${home.search}

#Cenário 1
Quando eu realizo uma busca informando o nome completo da matéria no campo de busca
    Click Element    ${home.search}
    Wait Until Element Is Visible    ${home.search_field}
    Input Text    ${home.search_field}    ${nome_completo_materia}
    Press Key    ${home.search_field}    \ue007

Então a matéria cujo a busca foi realizada é exibida
    ${resultado_nome_completo_materia}    Replace String    ${home.resultado_nome_completo_materia}    nome_completo_materia    ${nome_completo_materia}   
    Wait Until Element Is Visible    ${resultado_nome_completo_materia}    10
    Page Should Contain Element    ${resultado_nome_completo_materia}
    

#Cenário 2
Quando eu realizo uma busca informando um valor no campo de pesquisa cujo resultado traga mais de uma matéria
    Click Element    ${home.search}
    Wait Until Element Is Visible    ${home.search_field}
    Input Text    ${home.search_field}    ${nome_parcial_materia}
    Press Key    ${home.search_field}    \ue007

Então todas as matérias relacionadas aquela busca são exibidas
    ${resultado_nome_parcial_materia}    Replace String    ${home.resultado_nome_parcial_materia}    nome_parcial_materia    ${nome_parcial_materia}  
    Wait Until Element Is Visible    ${resultado_nome_parcial_materia}
    ${count}    Get Element Count    ${resultado_nome_parcial_materia}
    Should Be True    ${count}>1


#Cenário 3
Quando eu realizo uma busca informando um valor no campo de pesquisa cujo resultado não traga matérias
    Click Element    ${home.search}
    Wait Until Element Is Visible    ${home.search_field}
    Input Text    ${home.search_field}    ${nome_inexistente_materia}
    Press Key    ${home.search_field}    \ue007

Então uma mensagem deve ser exibida informando que nenhum resultado foi encontrado
    ${resultado_nao_encontrado}    Replace String    ${home.resultado_nao_encontrado}    mensagem_resultado_nao_encontrado    ${mensagem_resultado_nao_encontrado}
    Wait Until Element Is Visible    ${resultado_nao_encontrado}
    Page Should Contain Element    ${resultado_nao_encontrado}