#!/bin/bash

# Validate input parameters
if [ -z "$1" ]; then
  echo "Erro: Nome do projeto não fornecido"
  echo "Uso: $0 <nome-do-projeto> [organizacao]"
  exit 1
fi

PROJECT_NAME=$1
ORGANIZATION=${2:-neaigd}  # Default to neaigd if no organization provided

# Create project directory
mkdir "$PROJECT_NAME" || { echo "Erro ao criar diretório"; exit 1; }
cd "$PROJECT_NAME" || { echo "Erro ao entrar no diretório"; exit 1; }

# Initialize Git repository
git init || { echo "Erro ao inicializar repositório Git"; exit 1; }

# Create basic files
echo "# $PROJECT_NAME" > README.md
cat > .gitignore <<EOL
# Ignore node_modules
node_modules/

# Ignore IDE specific files
.idea/
.vscode/

# Ignore environment files
.env
EOL

# Create initial commit
git add .
git commit -m "Initial commit" || { echo "Erro ao criar commit inicial"; exit 1; }

# Create GitHub repository
gh repo create "$ORGANIZATION/$PROJECT_NAME" --private --source=. --remote=origin --push || { 
  echo "Erro ao criar repositório no GitHub";
  exit 1;
}

# Open in VS Code
code . || echo "VS Code não encontrado, abra manualmente o projeto"

echo "Projeto $PROJECT_NAME criado com sucesso!"
echo "Repositório: https://github.com/$ORGANIZATION/$PROJECT_NAME"
