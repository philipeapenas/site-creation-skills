# Processo de Web Design de um Projeto

Quatro etapas, nesta ordem. Nenhuma pula. Elas existem porque cada uma barra um erro caro que ja aconteceu em producao.

```
1. CURADORIA        leia o que existe, busque referencia real, escreva o design.md
        |
2. PRANCHETAS       mockup visual (artefato/canvas, se a ferramenta tiver um) -
        |           TODAS as telas do sistema, computador e celular
        |
3. VALIDACAO        o cliente/stakeholder ajusta e aprova ANTES de existir codigo
        |
4. IMPLEMENTACAO    frontend no CSS/HTML, backend no JS, nessa ordem
```

---

## Etapa 1 - Curadoria, e o `design.md`

### 1.1 Leia o que JA existe antes de buscar inspiracao fora

Ache o sistema visual do projeto (`estilo.css`, `tokens.css`, tema do Tailwind, `design.md` anterior). Extraia os valores REAIS (cor, escala tipografica, raio, espacamento, altura de controle), sem arredondar pra grade de 4/8px.

Interface nova ESTENDE esse vocabulario. So quando o cliente pedir repaginacao explicita e que a base muda, e ai vale dizer em voz alta o que a troca quebra.

### 1.2 Busque referencia na prateleira certa

`referencias_landing_page.md` cobre landing page. Pra SISTEMA (painel, admin, ferramenta), a prateleira e outra:

| O que falta | Onde buscar |
|---|---|
| Layout de painel inteiro, tratamento de KPI, densidade | Galeria de dashboard e template de admin |
| Componente pronto de codigo | 21st.dev primeiro (`/community/components`), depois Aceternity e Magic UI |
| Conceito visual, textura, ousadia | Pinterest e Dribbble, bom pra achar direcao, ruim pra copiar estrutura |
| A construcao de um projeto IRMAO da casa | O codigo do outro projeto, se existir um no mesmo time |

**Regra que nao muda:** referencia se COLA, nao se descreve. Descrever estilo em palavras ("moderno, clean, premium") produz o default generico de qualquer IA.

### 1.3 A melhor referencia costuma estar dentro de casa

Se ja existe outro projeto do mesmo time com construcao boa, abra o CSS dele e leia a construcao, nao lembre do site de memoria.

O corte que separa referencia de imitacao:

* **TRAGA a construcao** - o mecanismo (sombra, borda, textura, fisica de hover).
* **NAO TRAGA a identidade** - a cor da marca, o fundo, o logotipo. Aquilo pertence ao outro projeto; copiar e imitacao.

### 1.4 Escolha a identidade POR ELIMINACAO, nao por gosto

Num painel de operacao, verde ja significa "funcionando", amarelo "atencao", vermelho "falhou". Cor de marca que rouba um desses tres faz o painel mentir sobre o proprio estado.

### 1.5 Tipografia: duas familias com papeis declarados

A pilha do sistema operacional (`-apple-system, Segoe UI`) e boa pra botao e ruim pra ler conteudo longo. Escolha uma fonte de leitura de verdade.

* **Uma familia pra TEXTO** - a que o brief ou o cliente definir.
* **Uma MONOESPACADA, so onde o caractere precisa ser inequivoco** - numero grande, preco, codigo, identificador. Sempre com `font-variant-numeric: tabular-nums`, senao o alinhamento danca a cada leitura.
* Fuja do Inter, Roboto e Arial por padrao: sao a resposta automatica de toda IA.

### 1.6 Escreva o `design.md`

Fecha a etapa. Vive na raiz do projeto e e o registro escrito do sistema:

```
# Design - <projeto>
## Identidade      a cor da marca e POR QUE ela, nao so o hex
## Paleta          4-6 hex nomeados + as cores semanticas, separadas da marca
## Tipografia      as familias, com o papel de cada uma
## Construcao      o mecanismo (sombra, borda, textura) e de onde veio
## O que NAO veio  o que foi deliberadamente deixado na referencia, e por que
## Superficies     o que levanta e o que afunda (cartao x campo preenchivel)
```

**A secao "O que NAO veio" e obrigatoria.** E ela que impede a proxima pessoa de "completar" o design copiando o resto da referencia.

---

## Etapa 2 - As pranchetas de mockup

**TODAS as telas do sistema num lugar so, nao uma por vez.** Alinhamento de design vem com o sistema inteiro na mesa: o cliente so enxerga o que esta errado quando ve o padrao se repetindo, e descobrir problema tela a tela custa uma rodada de conversa por tela.

Regras do conteudo:

* **Estado REAL, nao estado feliz.** Se algo esta desligado, ele aparece desligado. Desenho todo verde esconde justamente o que precisa de decisao.
* **Dado no formato e ordem de grandeza do real.** Numero inventado gera layout que quebra no primeiro dia com dado de verdade.
* **Computador E celular, no mesmo lugar de revisao.** A adaptacao pro celular e decisao de design e vai anotada (por que essa alternativa e nao outra).

## Etapa 3 - Validacao

O cliente/stakeholder ajusta e aprova antes de qualquer codigo existir. Se ele editar o mockup diretamente, leia a versao dele de volta antes de continuar. Republicar por cima de uma edicao alheia apaga o trabalho de quem editou.

**Nada e implementado antes do ok.**

## Etapa 4 - Implementacao

Ordem recomendada: **frontend no CSS e no HTML, backend no JS.** Nessa ordem, porque JS escrito antes do CSS briga com layout que ainda vai mudar.

### A armadilha que ja custou uma entrega

**Pagina autocontida nao recebe a repaginacao sozinha.** Pagina de login servida antes da sessao, pagina de erro, pagina de e-mail: qualquer coisa fora do fluxo normal costuma nao carregar a folha de estilo principal e precisa dos tokens espelhados a mao.

Antes de dar a repaginacao por pronta, varra o projeto por toda pagina que nao carrega a folha principal.

### Preserve o contrato de IDs

Ao reestruturar o HTML, os IDs sao contrato com o JS. Confira ANTES de subir:

```
IDs que o JS usa e nao existem mais no HTML  -> quebra silenciosa
IDs novos no HTML sem JS                      -> tela morta
```

---

## Relacionadas

* `direcao_estetica_playbook.md` - o criterio estetico, que roda dentro da Etapa 1.
* `referencias_landing_page.md` - as prateleiras de referencia pra LANDING PAGE.
* `tema_escuro_playbook.md` - traducao pro modo escuro, quando o projeto tiver os dois.
