#Neste arquivo estão localizadas as configurações da automação e a declaração das variáveis que utilizo como massa de teste.

*** Settings ***
Library     SeleniumLibrary
Library     ../Libraries/Util.py

*** Variables ***
#Informações de configuração
&{Configiguracao}
...    url=https://blogdoagi.com.br/
...    browser=chrome


#Arquivo com a massa de teste
${massa_json}    ${CURDIR}\\Massa.json

*** Variables ***
${nome_completo_materia}
${nome_parcial_materia}
${nome_inexistente_materia}
${mensagem_resultado_nao_encontrado} 

*** Keywords ***

