#!/usr/bin/env bash
# Instala as skills frontend-expert e dev-expert num projeto (.claude/skills).
#
# Uso:
#   ./install.sh                       instala no diretorio atual (rode de dentro do seu projeto)
#   ./install.sh /caminho/do/projeto   instala num projeto em outro caminho

set -euo pipefail

DESTINO="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ORIGEM="$SCRIPT_DIR/skills"

if [ ! -d "$ORIGEM" ]; then
  echo "ERRO: pasta 'skills' nao encontrada ao lado deste script. Rode install.sh de dentro da pasta 'Skills para Devs'." >&2
  exit 1
fi

if [ ! -d "$DESTINO" ]; then
  echo "ERRO: destino '$DESTINO' nao existe." >&2
  exit 1
fi

RAIZ_DESTINO="$(cd "$DESTINO" && pwd)"
DESTINO_CLAUDE="$RAIZ_DESTINO/.claude/skills"
mkdir -p "$DESTINO_CLAUDE"

for skill in frontend-expert dev-expert; do
  origem_skill="$ORIGEM/$skill"
  destino_skill="$DESTINO_CLAUDE/$skill"

  if [ -d "$destino_skill" ]; then
    rm -rf "$destino_skill.bak"
    mv "$destino_skill" "$destino_skill.bak"
    echo "Aviso: ja existia '$skill' em .claude/skills. Versao anterior guardada em '$skill.bak'."
  fi

  cp -r "$origem_skill" "$destino_skill"
  echo "Instalado: $skill"
done

echo ""
echo "Pronto. Abra o Claude Code dentro de '$RAIZ_DESTINO' - as skills 'frontend-expert' e 'dev-expert' carregam sozinhas."
