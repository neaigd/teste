# Script de Criação de Projeto para Testes

## Casos de Teste

### 1. Criação de Projeto Básico (usando os padrões)
Executa o script para criar um repositório com os seguintes parâmetros:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- \
  --org "neaigd" \
  --name "projeto-basico" \
  --license "MIT" \
  --template "basic"
```
**Resultados Esperados:**
- Repositório "projeto-basico" criado na organização "neaigd".
- Estrutura de projeto correta inicializada.
- Arquivos do template "basic" criados.
- Arquivo LICENSE configurado com a licsença MIT.
- Commit inicial enviado para a branch main.

### 2. Template Node.js com Licença Customizada
Executa o script para criar um repositório com um template Node.js e licença GPL-3.0:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- \
  --org "neaigd" \
  --name "projeto-node" \
  --license "GPL-3.0" \
  --template "node"
```
**Resultados Esperados:**
- Repositório "projeto-node" criado na organização "neaigd".
- Estrutura do template Node.js inicializada.
- Arquivo LICENSE configurado para GPL-3.0.
- Commit inicial enviado para a branch main.

### 3. Template Python com Organização Customizada
Executa o script para criar um repositório com um template Python em uma organização customizada:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- \
  --org "custom-org" \
  --name "projeto-python" \
  --license "MIT" \
  --template "python"
```
**Resultados Esperados:**
- Repositório "projeto-python" criado na organização "custom-org".
- Estrutura do template Python corretamente inicializada.
- Arquivo LICENSE configurado com a licença MIT.
- Commit inicial enviado para a branch main.

### 4. Modo Dry Run (Simulação)
Executa o script em modo de validação sem efetuar mudanças reais:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- \
  --org "neaigd" \
  --name "projeto-dryrun" \
  --license "MIT" \
  --template "basic" \
  --dry-run
```
**Resultados Esperados:**
- Validação dos parâmetros sem criação efetiva do repositório.
- Mensagens informando as ações que seriam realizadas, sem alterações reais.

### 5. Exibição de Mensagem de Ajuda
Executa o script com o parâmetro de ajuda para exibição das instruções:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- --help
```
**Resultados Esperados:**
- Exibição da mensagem de ajuda com instruções de uso e lista de parâmetros disponíveis.

### 6. Parâmetro Inválido
Executa o script com um parâmetro desconhecido para validar o tratamento de erros:
```bash
curl -s https://raw.githubusercontent.com/neaigd/teste/main/create_project_v4.sh | bash -s -- \
  --org "neaigd" \
  --name "projeto-invalido" \
  --unknown "valor"
```
**Resultados Esperados:**
- Exibição de mensagem de erro indicando parâmetro inválido.
- Exibição da mensagem de ajuda ou instruções corretas para o uso do script.

## Referência de Parâmetros
| Parâmetro     | Valores Possíveis                 | Valor Padrão | Descrição                                       |
|---------------|-----------------------------------|--------------|-------------------------------------------------|
| -l, --license | MIT, GPL-3.0, Apache-2.0          | MIT          | Tipo de licença do projeto                      |
| -o, --org     | Nome da organização no GitHub      | neaigd       | Organização onde o repositório será criado      |
| -t, --template| basic, node, python                | basic        | Tipo de template para o projeto                 |
| -n, --name    | Nome do repositório                | -            | Especifica o nome do repositório a ser criado    |
| -d, --dry-run | (flag)                           | false        | Valida sem efetuar mudanças reais               |
| -h, --help    | (flag)                           | -            | Exibe a mensagem de ajuda                       |

## Resultados Esperados
Para cada caso de teste:
1. Repositório com o nome especificado criado na organização informada.
2. Estrutura de projeto corretamente inicializada conforme o template.
3. Arquivos e configurações (como LICENSE) de acordo com os parâmetros.
4. Commit inicial enviado para a branch main (exceto em modo dry run).

## Documentação dos Resultados dos Testes
| Caso de Teste      | Data       | Testador | Resultado | Observações |
|--------------------|------------|----------|-----------|-------------|
| Projeto Básico     | dd/mm/aaaa |          |           |             |
| Projeto Node.js    | dd/mm/aaaa |          |           |             |
| Projeto Python     | dd/mm/aaaa |          |           |             |
| Dry Run            | dd/mm/aaaa |          |           |             |
| Ajuda              | dd/mm/aaaa |          |           |             |
| Parâmetro Inválido | dd/mm/aaaa |          |           |             |
```