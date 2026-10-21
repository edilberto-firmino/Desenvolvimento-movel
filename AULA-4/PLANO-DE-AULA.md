# Plano de aula 4

**Disciplina:** Dispositivos Móveis  
**Tema:** Estilos e layouts com Flexbox  
**Duração:** ajustar à carga horária do encontro  
**Pré-requisito:** tela com View, Text, Image e Pressable preparada na aula 3

## Objetivos de aprendizagem

- Organizar estilos com nomes que expressem sua finalidade.
- Distinguir espaçamento interno, externo e entre elementos.
- Identificar os eixos principal e transversal de um layout.
- Utilizar direção e alinhamento para organizar imagem e informações.
- Adaptar o cartão à largura disponível sem cortar textos.
- Comparar a interface em pelo menos duas larguras e registrar o resultado.

## Preparação do professor

1. Abrir e executar o projeto da aula 3, preservando uma cópia da tela fora da pasta de rotas.
2. Aplicar e ensaiar as etapas de CONTEUDO.md, uma de cada vez.
3. Conferir se o projeto permite rotação; se não permitir, preparar dois aparelhos, emulador ou redimensionamento da execução web.
4. Testar um título longo e a ampliação de fonte do sistema.
5. Verificar como o layout atual trata cabeçalhos, barras inferiores e áreas seguras.
6. Preparar imagens da tela anterior e da versão adaptada para comparação.

## Roteiro sugerido

| Etapa | Parcela do encontro | Ação |
|---|---:|---|
| Retomada | 10% | Executar a tela anterior e apontar problemas de espaço e leitura. |
| Estilos e espaçamento | 20% | Experimentar padding, margin, gap e combinação de estilos. |
| Flexbox | 25% | Comparar row e column e prever o efeito dos alinhamentos. |
| Prática de adaptação | 30% | Reorganizar imagem e informações segundo a largura. |
| Verificação | 10% | Testar duas larguras, texto longo e fonte ampliada. |
| Fechamento | 5% | Justificar escolhas e preparar a organização em componentes da aula 5. |

## Condução didática

Antes de cada alteração, pedir uma previsão: “O que vai mudar na tela?”. Alterar uma propriedade por vez e comparar o resultado. Usar as caixas demonstrativas do conteúdo para explicar os eixos antes de voltar ao cartão.

Não avaliar apenas a aparência final. Pedir que o aluno identifique qual contêiner controla a direção e qual propriedade resolveu o problema observado.

Apresentar `useWindowDimensions` como ferramenta pronta para consultar a janela. Aprofundamento sobre hooks e estado não é requisito desta prática.

## Perguntas de acompanhamento

- O espaço está dentro ou fora do cartão?
- Ao mudar a direção, o eixo principal continua o mesmo?
- Por que `space-between` pode parecer não fazer nada?
- Qual elemento precisa ceder espaço para o título caber?
- Uma tela mais larga exige aumentar todos os textos?

## Avaliação formativa e contingências

Usar a atividade para observar compreensão, adaptação e registro dos testes, sem peso de nota definido. Se não houver dois aparelhos, aceitar comparação em duas larguras no navegador, identificando a plataforma. Esse teste não substitui a conferência das áreas seguras no celular.

Se a turma ainda estiver concluindo a aula 3, priorizar padding, margin, row, column e alinhamento. A adaptação condicional pode ser finalizada como prática orientada no início do próximo encontro; registrar o que ficou pendente.

## Continuidade

Guardar a tela e as evidências. Na aula 5, separar elementos repetidos em componentes e estudar propriedades, aproveitando a estrutura visual desenvolvida aqui.
