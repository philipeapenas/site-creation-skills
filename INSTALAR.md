# Instalar as Skills de Criacao de Site

Este arquivo tem dois publicos: cole ele inteiro (ou mande o link deste repositorio) pro seu assistente de codigo executar, ou siga o passo a passo manual na segunda metade se preferir fazer sozinho.

---

## Instrucoes pra IA (Claude Code, Cursor, Copilot ou similar)

Voce e um assistente de codigo rodando dentro de um projeto. O usuario quer instalar duas skills do Claude Code, `frontend-expert` e `dev-expert`, vindas do repositorio `site-creation-skills`, dentro do projeto atual. Siga exatamente estes passos, na ordem:

**Passo 1 - Confirme o destino.**
Rode `pwd` (Mac/Linux/Git Bash) ou `Get-Location` (PowerShell) e confirme com o usuario que este e o projeto ONDE ele quer instalar as skills. Se houver qualquer duvida sobre qual pasta e o projeto certo, pergunte antes de continuar. Nao assuma.

**Passo 2 - Garanta que o pacote esta disponivel localmente.**
- Se o usuario ja te deu um caminho local pra pasta `site-creation-skills` (baixada, zip extraido, clonada em outro lugar), use esse caminho direto.
- Se so tiver a URL do repositorio, clone pra uma pasta temporaria:
  - Windows (PowerShell): `git clone <URL-do-repo> "$env:TEMP\site-creation-skills"`
  - Mac/Linux/Git Bash: `git clone <URL-do-repo> /tmp/site-creation-skills`

**Passo 3 - Rode o instalador**, apontando pro diretorio atual (a raiz do projeto do Passo 1):
- Windows (PowerShell): `powershell -ExecutionPolicy Bypass -File "<caminho-do-pacote>\install.ps1" -Destino "."`
- Mac/Linux/Git Bash: `bash "<caminho-do-pacote>/install.sh" .`

O instalador copia as duas skills pra `.claude/skills/` do projeto atual. Se ja existir uma skill com o mesmo nome ali, ele guarda a versao anterior como `.bak` antes de sobrescrever, nada e perdido.

**Passo 4 - Confira o resultado.**
Liste os arquivos e confirme que os dois existem:
```
.claude/skills/frontend-expert/SKILL.md
.claude/skills/dev-expert/SKILL.md
```
Se algum nao existir, releia a saida do instalador (Passo 3) antes de dizer que terminou.

**Passo 5 - Avise o usuario.**
Diga que a instalacao terminou e que nao precisa de mais nenhuma configuracao: pedir uma interface, layout ou landing page aciona a `frontend-expert`; pedir escrita, revisao ou refatoracao de codigo aciona a `dev-expert`. Nenhuma das duas skills depende de chave de API, MCP ou variavel de ambiente pra funcionar (a frontend-expert usa um MCP de geracao de design se o ambiente tiver um configurado, mas funciona sem).

---

## Passo a passo manual (sem IA)

1. Baixe ou clone o repositorio `site-creation-skills`.
2. Copie a pasta `skills/frontend-expert` pra dentro de `<seu-projeto>/.claude/skills/frontend-expert`.
3. Copie a pasta `skills/dev-expert` pra dentro de `<seu-projeto>/.claude/skills/dev-expert`.
4. Abra o Claude Code no projeto. Pronto, nada mais pra configurar.

---

## Atualizar depois

Quando este repositorio receber uma atualizacao (nova versao de um playbook, correcao), atualize sua copia local (`git pull`, ou baixe de novo) e repita o Passo 3 do instalador. Ele sobrescreve so as duas pastas de skill, guardando a versao anterior em `.bak`, sem tocar em mais nada do projeto.
