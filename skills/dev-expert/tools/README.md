# Ferramentas do dev-expert

## clonar_repo.py

Traz um repositorio Git pra dentro do workspace, de forma idempotente.

```
python tools/clonar_repo.py <url>
python tools/clonar_repo.py <url> --nome prospector
python tools/clonar_repo.py <url> --destino "repos/clientes" --branch dev
python tools/clonar_repo.py <url> --dry-run
```

- Destino padrao: `repos/<nome-do-repo>`, com hifen ou underscore solto do fim
  do nome removido (`prospector-` vira `prospector`).
- Ja clonado e mesmo origin: roda `git pull --ff-only` em vez de falhar.
- Pasta ocupada por outro repo, ou com conteudo que nao e repo git: aborta com
  codigo 2, sem escrever nada por cima.
- No fim imprime branch, ultimo commit e os proximos passos deduzidos da stack
  (`requirements.txt`, `package.json`, arquivos `*.example.*` que precisam de
  credencial).

Ser colaborador de um repo e permissao de push, nao e ter o codigo na maquina:
por isso clonar continua sendo passo obrigatorio, e o push vai direto na branch,
sem fork e sem pull request (ajuste se o seu time usa PR).

## Validacao de codigo

As validacoes de codigo (code review) do dev-expert continuam sendo feitas por
analise estatica lendo os arquivos. Se lints, formatadores ou hooks forem
adotados, os scripts configuradores moram aqui.
