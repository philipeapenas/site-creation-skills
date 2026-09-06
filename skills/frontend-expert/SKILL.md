---
name: frontend-expert
description: Construa e itere em interfaces web de nivel de producao. Use esta skill sempre que o usuario pedir para criar, melhorar ou redesenhar uma interface frontend, landing page, link-in-bio, presell ou qualquer UI web estatica/dinamica, especialmente quando quiser estetica moderna, glassmorphism, layouts mobile-first, carrosseis ou paginas com scroll animado.
---

Acione esta skill sempre que o usuario pedir o WEB DESIGN de um projeto ou pagina, ou ao mencionar termos como "frontend", "layout", "landing page", "presell", "link-in-bio", "painel", "dashboard", "repaginar" ou "glassmorphism".

## Objetivo Estrategico

Produzir interfaces web modernas e responsivas, com um sistema visual autoral (nao o default generico de qualquer IA), integradas de forma limpa no projeto existente.

## Conexao de Recursos

**Memoria, consulte antes de qualquer mudanca visual:**

* `memory/processo_web_design.md` -> **[PADRAO EM PROJETO NOVO OU REPAGINACAO]** As quatro etapas do fluxo: curadoria de referencia + `design.md` -> pranchetas de mockup (artefato/canvas, se a ferramenta tiver um) -> validacao do cliente -> implementacao. Traz o corte entre referencia e imitacao, a escolha de cor por eliminacao, a regra das duas familias tipograficas e a armadilha da pagina que nao recebe a repaginacao sozinha.
* `memory/direcao_estetica_playbook.md` -> **[PADRAO]** Criterio de direcao estetica autoral. Consulte SEMPRE antes de definir paleta/tipografia/layout, em todo projeto.
* `memory/referencias_landing_page.md` -> **[OBRIGATORIO EM LANDING PAGE]** Onde buscar referencia real (galeria de LP, biblioteca de componente, banco de conceito), o metodo de colar print em vez de descrever estilo, e o teto de 2 a 3 referencias por projeto.
* `memory/movimento_playbook.md` -> **[PADRAO EM SITE COM SCROLL ANIMADO]** Coreografia de rolagem com GSAP + ScrollTrigger + Lenis. Consulte sempre que o site levar animacao de entrada ou parallax.
* `memory/css_cascata_playbook.md` -> **[OBRIGATORIO EM SOBRESCRITA RESPONSIVA]** `@media` NAO acrescenta especificidade, entao bloco de sobrescrita mora DEPOIS das bases que ele sobrescreve. Leia ANTES de escrever qualquer `@media`.
* `memory/tema_escuro_playbook.md` -> **[PADRAO EM MODO ESCURO]** Traducao de tema claro/escuro, efeito de transicao e as armadilhas de timing. Consulte sempre que o site levar troca de tema.
* `memory/mobile-scroll-fixes.md` -> **[REFERENCIA TECNICA]** Correcoes conhecidas de scroll e background fixo no mobile (especialmente iOS Safari).
* `memory/ui-mastery-playbook-2025.md` -> teste pontual de estetica (glassmorphism/dark mode premium). NAO e padrao obrigatorio, so consulte se o brief pedir essa estetica especifica.

**Ferramentas:**

* Se houver um MCP de geracao de design (ex: Google Stitch) disponivel no ambiente, use-o para acelerar a primeira versao visual. Na ausencia de um, va direto para HTML/CSS seguindo a direcao estetica definida no Passo 3 abaixo.
* Verifique a pasta `tools/` do projeto antes de assumir que um script auxiliar nao existe.

## Cadeia de Pensamento

**Passo 1 - Ler o que ja existe**
Leia o CSS/tokens/tema do projeto atual (se houver) antes de propor qualquer mudanca. Interface nova ESTENDE o vocabulario visual que ja existe; so troca a base quando o pedido for repaginacao explicita.

**Passo 2 - Pesquisa de Referencia e Componentes**
Determine se a mudanca e pagina nova, redesenho ou correcao pontual.
*CRITICO:* Antes de gerar qualquer design, leia `memory/referencias_landing_page.md` e escolha a prateleira certa (galeria de pagina inteira, biblioteca de componente de codigo ou banco de conceito visual). Traga de 2 a 3 referencias no maximo, usando a IMAGEM da referencia em vez de descrever o estilo em palavras.
*TRAVA:* Em landing page, NAO comece sem a copy aprovada pelo cliente/stakeholder. E o texto que define quantas secoes existem, qual e o pico da pagina e onde cada CTA cai. Se a copy nao estiver pronta, peca antes de desenhar.

**Passo 3 - Definir Direcao Estetica (Brainstorm + Plano + Autocritica)**
Leia `memory/direcao_estetica_playbook.md` antes de gerar qualquer coisa. Monte o brainstorm curto: paleta (4-6 hex nomeados), tipografia (2+ familias por papel), conceito de layout (wireframe ascii) e o elemento-assinatura. Revise esse plano contra o brief, se alguma parte parecer o default generico de IA, revise antes de seguir.

**Passo 4 - Gerar/Construir**
Use o MCP de design disponivel (se houver) seguindo a direcao do Passo 3, ou escreva o HTML/CSS diretamente.

**Passo 5 - Integrar no Projeto**
Mantenha a estrutura de arquivos existente. Se o projeto usa um arquivo central de configuracao (tokens, `config.js` ou equivalente) como fonte da verdade, escreva por ele em vez de hardcodar valores espalhados.

**Passo 6 - Refinamento Cirurgico de UI (CSS/HTML)**
Voce esta autorizado e espera-se que modifique manualmente CSS e HTML para garantir estetica pixel-perfect: ajuste margens, flexbox e corrija problemas de rolagem mobile. Nao dependa so da geracao automatica.

**Passo 7 - Validar e Documentar**
Rode o Delivery Checklist de cada playbook consultado (cascata, movimento, tema escuro, conforme aplicavel). Tire screenshot e critique o resultado contra o plano do Passo 3. Antes de dar por pronto, varra o projeto por pagina que nao carrega a folha de estilo principal (login, erro, e-mail) e por IDs que o JS usa e o HTML reestruturado deixou de ter.
