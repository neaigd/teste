# Exemplo 1: Criando um Novo Projeto

## Cenário
Você precisa criar um novo repositório chamado "meu-projeto" na organização "neaigd"

## Passos
1. Navegue até o diretório onde deseja criar o projeto
2. Execute o comando:
```bash
./create_project.sh meu-projeto
```

## Resultado Esperado
- Diretório `meu-projeto` criado
- Repositório Git inicializado
- README.md básico criado
- Repositório criado no GitHub: https://github.com/neaigd/meu-projeto
- Projeto aberto no VS Code

## Verificando
Confira se o repositório foi criado corretamente:
```bash
cd meu-projeto
git remote -v
