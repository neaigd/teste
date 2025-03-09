# Uso Avançado

## Opções Adicionais

### Criar repositório privado
Após criar o repositório, execute:
```bash
gh repo edit neaigd/nome-do-repositorio --visibility private
```

### Usar template personalizado
1. Crie um diretório template/ com sua estrutura preferida
2. Modifique o script para copiar o template ao invés de criar um README.md básico

### Configurações Globais
Defina variáveis de ambiente para:
- ORGANIZACAO (padrão: neaigd)
- VISIBILIDADE (padrão: public)
- EDITOR (padrão: code)

## Exemplos
Criando múltiplos repositórios:
```bash
for projeto in projeto1 projeto2 projeto3; do
  ./create_project.sh $projeto
done
