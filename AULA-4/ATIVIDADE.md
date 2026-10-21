# Atividade — Uma tela em diferentes tamanhos

**Formato:** individual ou em duplas.  
**Base:** aplicativo e cartão de evento da aula 3.  
**Objetivo:** organizar a interface e justificar suas adaptações.

## Parte 1 — Diagnóstico

Executar a versão anterior e registrar dois pontos a melhorar: espaçamento, alinhamento, uso da largura ou leitura dos textos. Guardar uma captura da tela antes das alterações.

## Parte 2 — Experimento

Realizar o experimento das caixas A, B e C de [CONTEUDO.md](CONTEUDO.md). Antes de executar cada mudança, anotar a previsão. Depois, registrar se o resultado correspondeu ao esperado.

Explicar o efeito de `row`, `column`, `justifyContent` e `alignItems` no exemplo. Remover as caixas ao concluir.

## Parte 3 — Adaptar o cartão

1. Aplicar as etapas A a D do conteúdo no projeto existente.
2. Manter nome, data, local, imagem e botão do evento escolhido.
3. Conferir se título e mensagem do botão continuam coerentes.
4. Aplicar espaçamento interno e entre os elementos sem duplicações desnecessárias.
5. Apresentar imagem acima dos detalhes na janela estreita e ao lado na larga.
6. Preservar a rolagem e evitar altura fixa para o cartão.
7. Conferir áreas seguras com o professor no aparelho disponível.

## Parte 4 — Testar e registrar

Preencher uma tabela como esta com os valores realmente observados:

| Plataforma e largura | Condição testada | Resultado | Ajuste ou pendência |
|---|---|---|---|
| Registrar | Janela abaixo de 600 | Registrar | Registrar |
| Registrar | Janela a partir de 600 | Registrar | Registrar |
| Registrar | Título longo | Registrar | Registrar |
| Registrar | Fonte ampliada | Registrar | Registrar |
| Registrar | Áreas seguras no celular | Registrar | Registrar |

Para obter a largura, observar temporariamente `width` com um `Text` dentro da tela: `<Text>Largura: {width}</Text>`. Remover essa informação da interface ao concluir.

Se não houver aparelho para algum teste, marcar como pendente. Capturas no navegador podem demonstrar mudança de composição, mas não substituem teste das barras do sistema no celular.

## Parte 5 — Explicar

1. Qual a diferença entre padding, margin e gap?
2. Em `row`, em qual eixo atua `justifyContent`?
3. Por que a área dos detalhes recebe `flex: 1` somente na composição larga?
4. Por que fixar a altura do cartão pode causar problemas?
5. O que mudou ao ampliar a fonte ou alongar o título?
6. Qual teste ainda está pendente e por quê?

## Entrega e acompanhamento

Entregar identificação dos integrantes, captura anterior, duas capturas em larguras diferentes, tabela de testes e respostas. O professor poderá pedir demonstração no projeto.

| Critério | Evidência |
|---|---|
| Espaçamento | Distingue e aplica espaço interno e externo. |
| Flexbox | Explica direção e alinhamento. |
| Adaptação | Demonstra as duas composições. |
| Leitura | Mantém textos e botão acessíveis sem cortes. |
| Verificação | Registra condições reais e pendências. |

Avaliação formativa, sem peso de nota definido. Preservar o projeto para a aula 5.

**Desafio opcional:** escolher outro limite de largura, testar e justificar por que ele atende melhor ao conteúdo do cartão.
