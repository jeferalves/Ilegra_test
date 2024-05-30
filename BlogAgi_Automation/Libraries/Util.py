import json

def Retornar_valor_campo(arquivo, nome_campo):
    
    f = open(arquivo)
   
    data = json.load(f)
    return data.get(nome_campo, "Field not found")