# Fluxo de Criação de Repositórios no GitHub

## Visão Geral
Automatização da criação de repositórios GitHub via linha de comando

## Funcionalidades
- Criação de repositórios locais e remotos
- Inicialização Git automática
- Criação de README.md padrão
- Integração com GitHub CLI
- Abertura automática no VS Code
- Suporte para templates de workflows
- Cópia automática de templates CI/CD
- Seleção de licença (MIT, GPL-3.0, Apache-2.0)

## Documentação
A documentação completa está organizada em:

- **Uso Básico**: [docs/usage/basic-usage.md](docs/usage/basic-usage.md)
- **Uso Avançado**: [docs/usage/advanced-usage.md](docs/usage/advanced-usage.md)
- **Desenvolvimento**:
  - [Contribuição](docs/development/contributing.md)
  - [Roadmap](docs/development/roadmap.md)
- **Referência**: [docs/reference/script-reference.md](docs/reference/script-reference.md)
- **Exemplos**: [docs/examples/example1.md](docs/examples/example1.md)
- **Fluxo Principal**: [docs/fluxo.md](docs/fluxo.md)

## Como Usar
1. Instale o GitHub CLI
2. Execute o script:
```bash
./create_project.sh nome-do-projeto
```

## Exemplos
Criando um repositório público:
```bash
./create_project.sh meu-projeto
```

Criando um repositório privado:
```bash
gh repo edit neaigd/meu-projeto --visibility private
```

## Contribuição
Siga o guia em [docs/development/contributing.md](docs/development/contributing.md)
