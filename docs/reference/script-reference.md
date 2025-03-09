# Referência do Script

## Estrutura
```bash
#!/bin/bash

# Configurações
ORGANIZACAO="neaigd"
VISIBILIDADE="public"
EDITOR="code"

# Funções principais
criar_diretorio() { ... }
inicializar_git() { ... }
criar_repositorio_remoto() { ... }
abrir_vscode() { ... }

# Fluxo principal
main() {
  validar_argumentos "$@"
  criar_diretorio "$1"
  inicializar_git
  criar_repositorio_remoto "$1"
  abrir_vscode "$1"
}
```

## Variáveis de Ambiente
- ORGANIZACAO: Nome da organização no GitHub
- VISIBILIDADE: Visibilidade do repositório (public/private)
- EDITOR: Editor de código padrão

## Funções Principais
- `criar_diretorio`: Cria estrutura de diretórios
- `inicializar_git`: Configura repositório local
- `criar_repositorio_remoto`: Cria repositório no GitHub
- `abrir_vscode`: Abre projeto no editor
