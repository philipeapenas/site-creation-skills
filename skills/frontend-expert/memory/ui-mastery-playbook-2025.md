# 2025 UI/UX Mastery Playbook

Teste pontual de estilo (glassmorphism e dark mode premium), NAO e padrao obrigatorio pra todo projeto. So consulte quando o brief pedir essa estetica especifica ou o cliente citar como referencia. Por padrao, a direcao estetica nasce do `direcao_estetica_playbook.md`.

## 1. Neumorphism 2.0 e Premium Glassmorphism
- **Profundidade sem sujeira:** evite sombras muito duras ou escuras. O Neumorphism 2.0 foca em relevos sutis.
- **Vidro fosco (glassmorphism):** use proporcoes exatas pra visual sofisticado:
  ```css
  background: rgba(255, 255, 255, 0.05); /* ou dark rgba(0,0,0,0.3) */
  backdrop-filter: blur(12px) saturate(1.2);
  -webkit-backdrop-filter: blur(12px) saturate(1.2);
  border: 1px solid rgba(255, 255, 255, 0.1);
  box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
  ```
- **Hierarquia visual:** use o glassmorphism apenas em cards, modais e containers de destaque, nunca no background base.

## 2. Spatial Design e Minimalismo Dinamico
- O minimalismo em 2025 nao e mais "tudo chapado" (flat). E claridade espacial.
- Use o eixo Z. Camadas com niveis diferentes de `blur` devem se sobrepor pra criar uma paralaxe de UI.
- Deixe os elementos "respirarem" (muito `padding`, `gap`, e margens generosas).

## 3. Dark Mode Nativo e Complexo
- **Fundo sofisticado:** nunca use preto absoluto (`#000000`). Use tons como `#0d0d0d`, `#11181c` ou nuances azuladas muito escuras.
- **Gradientes acentuados:** fundos podem ter `radial-gradient` sutis, quase invisiveis, que revelam cantos da tela em roxo ou rosa muito suave pra dar vida.

## 4. Microinteracoes Tangiveis
- Adicione `transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);` em praticamente todos os botoes e links.
- Em estados de `:hover` ou `:active`, o elemento deve se transformar (ex: `transform: translateY(-2px) scale(1.02);`) ou aumentar o "brilho" da borda translucida.

## 5. Arquitetura Below-The-Fold e Scroll Responsivo
- **Evite o trava-tela:** ao projetar layouts hibridos (fundo fixo com conteudo longo que desliza por cima), JAMAIS use `overflow: hidden;` na tag `body`. Isso destroi o touch-scroll nativo no iOS e em navegadores in-app de redes sociais. Use estritamente `overflow-x: hidden;` acompanhado de containers com `min-height: 100dvh`.
- **Cache-busting agressivo:** navegadores in-app de redes sociais ignoram `no-cache` comum. Ao atualizar um CSS/JS que precisa refletir na hora pra um usuario que ja tinha aberto a pagina antes, altere a string de query parameter (`?v=...`) na importacao do arquivo em todo HTML que o usa.

## 6. Engenharia de Referencias (21st.dev)
- **Fonte primaria de inspiracao:** acesse `https://21st.dev/community/components` pra analisar estruturalmente os componentes mais modernos feitos pela comunidade.
- **Implementacao premium:** use os codigos (React, Tailwind, Framer Motion ou animacoes CSS modernas) pra construir a melhor interface possivel. Nao e obrigatorio converter tudo pra Vanilla CSS, a missao e o resultado final ficar deslumbrante e sofisticado, usando as melhores ferramentas disponiveis.
