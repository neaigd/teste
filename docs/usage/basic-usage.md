## Execução Remota de Scripts

Você pode executar scripts diretamente do repositório GitHub usando:

```bash
bash <(curl -s https://raw.githubusercontent.com/seu-usuario/seu-repo/main/caminho/do/script.sh)
```

Ou, para maior segurança e controle:

```bash
curl -s https://raw.githubusercontent.com/seu-usuario/seu-repo/main/caminho/do/script.sh | bash -s -- --param1 valor1 --param2 valor2
```

Isso permite:
- Centralização do código fonte
- Atualizações automáticas
- Execução em qualquer máquina com acesso à internet
