#Este é o arquivo principal onde se encontram os casos de teste escritos em Gherkin.
#Aqui, procurei abstrair ao máximo para que somente a regra de negócio fosse exibida nesse arquivo.
#A implementação dos steps está em Principal_Steps.robot.

*** Settings ***
Resource    ../Steps/Principal_Steps.robot    

Suite Setup    Abrir Site
Suite Teardown    Fechar Site

*** Test Cases ***
Cenário 1:Validar busca informando o nome completo da matéria no campo de busca
    [Tags]    Regressão
    Dado que estou com o site Blog do Agi aberto
    Quando eu realizo uma busca informando o nome completo da matéria no campo de busca
    Então a matéria cujo a busca foi realizada é exibida

Cenário 2:Validar busca informando um valor no campo de pesquisa cujo resultado traga mais de uma matéria
    [Tags]    Regressão
    Dado que estou com o site Blog do Agi aberto
    Quando eu realizo uma busca informando um valor no campo de pesquisa cujo resultado traga mais de uma matéria
    Então todas as matérias relacionadas aquela busca são exibidas

Cenário 3:Validar busca informando um valor no campo de pesquisa cujo resultado não traga matérias
    [Tags]    Regressão
    Dado que estou com o site Blog do Agi aberto
    Quando eu realizo uma busca informando um valor no campo de pesquisa cujo resultado não traga matérias
    Então uma mensagem deve ser exibida informando que nenhum resultado foi encontrado
