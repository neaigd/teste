# Mudanças na Versão 3.0

## Novas Funcionalidades

### Templates de Workflows
- Adicionado suporte para templates de workflows
- Cópia automática de templates do diretório `workflow-templates`
- Verificação de templates existentes antes da cópia

## Melhorias
- Documentação atualizada para refletir as novas funcionalidades
- Código mais modular e organizado
- Melhor tratamento de erros durante a cópia de templates

## Como Usar

1. Crie um diretório `workflow-templates` no mesmo nível do script
2. Coloque seus templates YAML dentro deste diretório
3. Execute o script normalmente
4. Os templates serão copiados automaticamente para o novo projeto

## Exemplo de Estrutura

```
workflow-templates/
├── license-automation.yml
└── test-and-lint.yml
```

## Considerações
- Templates são copiados apenas se o diretório existir
- Arquivos existentes no destino não são sobrescritos
- A estrutura de diretórios é preservada
