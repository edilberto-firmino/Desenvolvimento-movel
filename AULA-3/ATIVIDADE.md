# Atividade — Cartão de um evento

**Formato:** individual ou em duplas.  
**Ponto de partida:** projeto da aula 2.  
**Objetivo:** montar uma tela com os quatro componentes estudados e demonstrar uma interação.

## Situação

A faculdade quer apresentar um evento à comunidade. Sua tarefa é criar uma primeira tela com informações e um botão que mostre uma mensagem de demonstração.

Use um evento fictício: palestra, oficina, encontro cultural ou atividade esportiva. Não é necessário implementar inscrição real.

## Parte 1 — Planejar a tela

Definir:

- Nome do evento.
- Data fictícia, local e descrição curta.
- Imagem ilustrativa disponível para uso.
- Texto do botão e mensagem que será exibida ao tocar.

Identificar no desenho quais elementos correspondem a `View`, `Text`, `Image` e `Pressable`.

## Parte 2 — Construir

1. Abrir o projeto existente e localizar a tela inicial.
2. Guardar o conteúdo anterior fora da pasta de rotas.
3. Usar o exemplo de [CONTEUDO.md](CONTEUDO.md) como apoio.
4. Personalizar título, informações e mensagem do botão.
5. Inserir uma imagem remota acessível ou uma imagem local com caminho correto.
6. Manter os textos dentro de `Text` e o cartão organizado por uma `View`.
7. Configurar o botão com `onPress` e identificação acessível coerente com o evento.

Não é necessário criar outras telas, usar API ou adicionar formulário. Preservar os arquivos de navegação do projeto.

## Parte 3 — Verificar

- A tela mostra as informações do evento escolhido?
- A imagem aparece com tamanho definido?
- O texto do botão está legível?
- Ao tocar, o diálogo aparece no Android ou iOS?
- A mensagem corresponde ao evento apresentado?
- O conteúdo pode ser lido sem cortes, usando rolagem quando necessário?

Se estiver usando somente o navegador, registrar o teste do alerta nativo como pendente e combinar uma demonstração em aparelho com o professor.

## Parte 4 — Explicar

1. Qual é o papel da `View` no cartão?
2. Por que precisamos de `Text` dentro do botão?
3. Qual a diferença entre imagem remota e imagem local?
4. O que acontece quando escrevemos `onPress={mostrarInteresse()}` em vez de passar a função?
5. O aplicativo realmente guardou o interesse do usuário? Justifique.

## Entrega

- Identificação dos integrantes.
- Caminho do arquivo editado.
- Captura ou demonstração da tela.
- Demonstração do botão no aparelho ou registro da pendência.
- Respostas às perguntas e uma dificuldade encontrada.

Preservar o projeto para a aula 4. O professor pode conferir o código diretamente no editor; não é necessário entregar dependências como `node_modules`.

## Critérios de acompanhamento

| Critério | Evidência esperada |
|---|---|
| Estrutura | Usa os quatro componentes e organiza o cartão. |
| Conteúdo | Apresenta informações coerentes e legíveis. |
| Imagem | Configura origem e dimensões corretamente. |
| Interação | Passa a função ao botão e demonstra a mensagem. |
| Compreensão | Explica o papel dos componentes e os limites da demonstração. |

Avaliação formativa, sem peso de nota definido. Registrar dificuldades de infraestrutura separadamente das dificuldades de compreensão.

**Desafio opcional:** personalizar a aparência pressionada do botão e explicar a função de `pressed`, sem adicionar novas dependências.
