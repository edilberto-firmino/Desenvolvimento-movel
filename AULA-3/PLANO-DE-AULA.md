# Plano de aula 3

**Disciplina:** Dispositivos Móveis  
**Tema:** Componentes básicos — View, Text, Image e Pressable  
**Duração:** ajustar à carga horária do encontro  
**Pré-requisito prático:** projeto da aula 2 criado e executando

## Objetivos de aprendizagem

Ao final, o aluno deverá conseguir:

- Identificar componentes na interface e relacioná-los ao código.
- Organizar elementos dentro de uma `View`.
- Exibir textos e uma imagem com dimensões definidas.
- Associar uma ação de demonstração ao toque em um `Pressable`.
- Explicar a diferença entre passar uma função e executá-la imediatamente.
- Montar uma tela simples e verificar seu funcionamento no aparelho.

## Preparação do professor

1. Abrir o projeto de referência da aula 2 e identificar o arquivo da tela inicial.
2. Guardar uma cópia do conteúdo original fora da pasta de rotas antes de substituir a tela.
3. Ensaiar o exemplo de CONTEUDO.md no projeto e no aparelho disponíveis.
4. Testar o carregamento da imagem remota; preparar uma imagem local caso a rede esteja indisponível.
5. Conferir se o cabeçalho e os controles do sistema não cobrem o conteúdo da tela.
6. Reservar apoio inicial para alunos com pendências de instalação.

Não criar outro projeto para quem já concluiu a aula 2. Manter o layout de navegação existente; a aula modifica apenas a tela inicial.

## Roteiro sugerido

| Etapa | Parcela do encontro | Condução |
|---|---:|---|
| Retomada | 10% | Abrir o projeto e recuperar o desenho de telas da aula 1. |
| Leitura de interface | 15% | Identificar agrupamentos, textos, imagem e área de toque em um cartão de evento. |
| Construção guiada | 30% | Montar a tela por etapas: View e Text, depois Image e Pressable. |
| Atividade dos alunos | 30% | Personalizar o evento e demonstrar a ação do botão. |
| Verificação e discussão | 10% | Conferir imagem, legibilidade, toque e erros encontrados. |
| Fechamento | 5% | Relacionar estrutura de componentes e organização visual. |

## Estratégia de explicação

Começar com uma `View` contendo dois `Text`. Executar antes de acrescentar outros elementos. Inserir a imagem e mostrar suas propriedades. Por último, adicionar o botão e sua função.

Apresentar `import`, função, `return` e JSX apenas no nível necessário à leitura. Não pressupor que a turma já domina React. Explicar que os componentes começam com letra maiúscula e que as chaves permitem inserir expressões no JSX.

Utilizar o exemplo completo como referência para o professor; durante a aula, construir gradualmente para que os alunos relacionem cada adição ao resultado visual.

## Perguntas para a turma

- Qual componente organiza o cartão? Qual mostra o título?
- Por que o texto do botão também fica em um `Text`?
- Como o aplicativo sabe qual imagem carregar?
- Quando a função ligada a `onPress` deve executar?
- O botão realizou uma inscrição ou apenas mostrou uma mensagem?

## Avaliação formativa

Observar a presença dos quatro componentes, a relação entre código e interface e o teste do botão. Pedir uma explicação breve do código, além da captura de tela. Não há peso de nota definido.

Quando houver dificuldades de equipamento, permitir trabalho em duplas. A execução web pode ajudar a observar a interface, mas o alerta do exemplo deve ser validado em Android ou iOS. Registrar a plataforma utilizada e qualquer teste pendente.

## Limites desta aula e continuidade

O botão apenas confirma uma interação; não salva dados nem efetua inscrição. Estado será estudado na aula 6, formulários na aula 7 e navegação na aula 8. Na aula 4, aprofundar estilos, espaçamento, alinhamento e Flexbox a partir desta mesma tela.
