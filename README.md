# Guia de Instalação e Execução do Projeto BlogAgi Automation

## Instalação

1. **Baixar e Instalar o Python:**
   - Baixe e instale a última versão do Python no site oficial: [python.org](https://www.python.org/downloads/).
   
2. **Verificar Instalação do Python:**
   - Após a instalação, abra o terminal ou prompt de comando e execute o seguinte comando para verificar se o Python foi instalado corretamente:
     ```
     pip --version
     ```

3. **Instalar o Robot Framework:**
   - No terminal ou prompt de comando, execute o seguinte comando para instalar o Robot Framework:
     ```
     pip install robotframework
     ```

4. **Instalar a Biblioteca Selenium:**
   - Execute o seguinte comando para instalar a biblioteca Selenium do Robot Framework:
     ```
     pip install --upgrade robotframework-seleniumlibrary
     ```

5. **Instalar o Chrome Driver:**
   - Faça o download do Chrome Driver compatível com a versão do seu navegador Chrome e adicione-o ao PATH do sistema.

## Execução do Teste e Verificação do Relatório

1. **Abrir o Prompt de Comando:**
   - Abra o prompt de comando ou terminal.

2. **Navegar até a Pasta de Testes:**
   - No prompt de comando, navegue até a pasta `BlogAgi_Automation\Tests` do projeto.

3. **Executar os Testes:**
   - Digite o seguinte comando para executar os testes:
     ```
     robot principal.robot
     ```

4. **Verificar o Relatório de Execução:**
   - Após a conclusão dos testes, o resultado será exibido no próprio prompt de comando.
   - Para uma visualização detalhada, abra o arquivo `report.html` localizado na raiz do projeto em um navegador da web.
