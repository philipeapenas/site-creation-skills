# Skills de Criacao de Site

Duas skills do Claude Code prontas pra qualquer projeto de site: `frontend-expert` (UI, CSS, animacao, tema escuro, referencia visual) e `dev-expert` (revisao e escrita de codigo, Clean Code, programacao defensiva). Sao versoes portateis, sem dependencia de nenhum sistema interno, prontas pra rodar em qualquer workspace.

**Pra instalar, veja [`INSTALAR.md`](./INSTALAR.md).** Tem o comando de 1 linha (pra mandar direto pro seu assistente de codigo executar) e o passo a passo manual.

## O que tem aqui

```
site-creation-skills/
├── README.md          este arquivo
├── INSTALAR.md         instrucoes de instalacao (pra IA e pra humano)
├── install.ps1          instalador (Windows, PowerShell)
├── install.sh            instalador (Mac/Linux/Git Bash)
└── skills/
    ├── frontend-expert/
    │   ├── SKILL.md
    │   └── memory/       (playbooks: cascata CSS, movimento/scroll, tema escuro, direcao estetica, referencias de LP)
    └── dev-expert/
        ├── SKILL.md
        ├── memory/       (playbook de Clean Code, defensive programming, self-review)
        └── tools/        (clonar_repo.py, script auxiliar de clone/pull idempotente)
```

## Requisito

Ter o Claude Code instalado e rodando no projeto. Nada alem disso, as duas skills nao chamam nenhum servico ou MCP obrigatorio (se o ambiente tiver um MCP de geracao de design, a frontend-expert usa; se nao tiver, ela desenha em HTML/CSS direto).

## O que NAO vem aqui

Essas skills sao a versao solta, sem o protocolo de mensagens entre skills nem a integracao com nenhum vault ou banco de dados interno. Elas funcionam sozinhas, cada uma le a propria memoria e executa. Se o seu time quiser orquestracao entre varias skills (handoff automatico, fila de tarefas), isso e uma camada separada, nao faz parte deste pacote.

## Atualizando este repositorio

Quando uma skill daqui for revisada ou ganhar um playbook novo, o commit entra direto neste repositorio (`tools/backup.bat` sobe tudo). Quem ja instalou so precisa repetir o passo de instalacao (ver `INSTALAR.md`, secao "Atualizar depois") pra puxar a versao nova.
