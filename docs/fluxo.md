- [x] Ideia: Vou automatizar a criação de repositórios e documentar tudo.
- [x] Refinamento: Quero fazer tudo pela linha de comando.
- [x] Como: documentar e testar o passo a passo
- [x] Testar: e corrigir até funcionar
- [x] Criar o script para automatizar
- [ ] Gerar a documentação do script e do projeto
	- [ ] precisa conter o fluxo do que fiz
	- [ ] pode ser refinado por ai
	- [ ] posso utilizar o cline para me auxiliar com isso
- [x] Enviar essa nota para o repositório

Para criar um novo projeto no GitHub usando SSH e linha de comando no Linux, siga este fluxo de trabalho:


```shell
mkdir meu-projeto && cd meu-projeto
git init
git remote add origin git@github.com:neaigd/nome-do-repositorio.git
echo "# Meu Projeto" > README.md
git add .
git commit -m "Initial commit"
gh repo create "$ORGANIZACAO/$NOME_PROJETO" --public --source=. --remote=origin --push
git push -u origin main
```

Fluxo:
```mermaid
graph TD
    A[Iniciar] --> B{Nome de projeto?}
    B -- Sim --> C[Criar diretório do projeto]
    C --> D[Entrar no diretório]
    D --> E[Inicializar Git]
    E --> F[Criar README.md]
    F --> G[Adicionar arquivos ao Git]
    G --> H[Commit inicial no Git]
    H --> I[Criar repositório remoto no GitHub]
    I --> J[Abrir diretório no VS Code]
    J --> K[Fim]
    B -- Não --> L[Exibir mensagem de erro]
    L --> M[Sair]

style A fill:#4CAF50,stroke:#2E7D32,stroke-width:2px,color:#000000
style M fill:#F44336,stroke:#C62828,stroke-width:2px,color:#FFFFFF
style K fill:#2196F3,stroke:#1565C0,stroke-width:2px,color:#FFFFFF
style B fill:#FFC107,stroke:#FF8F00,stroke-width:2px,color:#000000
style C fill:#9C27B0,stroke:#6A1B9A,stroke-width:2px,color:#FFFFFF
style D fill:#FF9800,stroke:#EF6C00,stroke-width:2px,color:#000000
style E fill:#00BCD4,stroke:#00838F,stroke-width:2px,color:#000000
style F fill:#8BC34A,stroke:#558B2F,stroke-width:2px,color:#000000
style G fill:#FF5722,stroke:#D84315,stroke-width:2px,color:#FFFFFF
style H fill:#673AB7,stroke:#4527A0,stroke-width:2px,color:#FFFFFF
style I fill:#3F51B5,stroke:#283593,stroke-width:2px,color:#FFFFFF
style J fill:#009688,stroke:#00695C,stroke-width:2px,color:#FFFFFF
style L fill:#E91E63,stroke:#AD1457,stroke-width:2px,color:#FFFFFF

```


Exemplo de repositório criado:  https://github.com/neaigd/teste

vou modificar a exibição para privada 

gh repo edit neaigd/teste --visibility private
