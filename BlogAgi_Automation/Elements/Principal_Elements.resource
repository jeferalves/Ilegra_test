#Este é o arquivo que contém os elementos mapeados da tela. Como só temos uma tela, não foi necessário criar outros arquivos.
#No entanto, caso optemos pela automação de outras telas, cada tela terá um arquivo correspondente para facilitar o mapeamento.

*** Settings ***
Resource    ../Resource/Settings.resource

*** Variables ***
&{home}
...    search=xpath://a[@class="slide-search astra-search-icon"]
...    search_field=id:search-field
...    resultado_nome_completo_materia=//a[contains(text(), "nome_completo_materia")]
...    resultado_nome_parcial_materia=//a[contains(text(), "nome_parcial_materia")]
...    resultado_nao_encontrado=//*[contains(text(), "mensagem_resultado_nao_encontrado")]

