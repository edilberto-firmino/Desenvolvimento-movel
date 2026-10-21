# Conteúdo — Estilos e Flexbox

## 1. O problema desta aula

A tela da aula 3 já apresenta um evento e responde ao toque. Agora vamos melhorar sua organização: criar espaços consistentes, posicionar imagem e informações e evitar que a interface dependa de um único tamanho de aparelho.

Antes de editar, observar a tela e anotar: o que está apertado, desalinhado ou difícil de ler?

## 2. Estilos no React Native

Os estilos são objetos JavaScript, com propriedades como `backgroundColor` e `fontSize`. É possível combinar objetos em um array; quando a mesma propriedade aparece mais de uma vez, o estilo posterior prevalece. [Estilos — React Native](https://reactnative.dev/docs/style)

```tsx
<View style={[styles.cartao, styles.destaque]}>
  <Text>Evento em destaque</Text>
</View>
```

Esse fragmento pressupõe componentes importados e estilos definidos. Continuaremos utilizando `StyleSheet.create` no arquivo da tela.

### Espaçamento

| Propriedade | Pergunta que ajuda a escolher | Uso no exercício |
|---|---|---|
| `padding` | Quanto espaço quero entre borda e conteúdo? | Interior do cartão. |
| `marginBottom` | Quanto espaço quero depois deste elemento? | Separação entre título e cartão. |
| `gap` | Quanto espaço quero entre os filhos do contêiner? | Distância entre imagem e informações. |

Evitar aplicar vários espaçamentos à mesma separação sem perceber que eles se somam. Comparar visualmente os valores 8, 16 e 24, usados como convenção didática do exercício.

## 3. Flexbox e os eixos

`flexDirection` define o eixo principal. No React Native, o padrão é `column`. `justifyContent` atua nesse eixo; `alignItems` atua no transversal. `gap` separa os filhos. `flexWrap: 'wrap'` permite quebrar uma sequência em linhas. `flexShrink` permite que um item ceda espaço quando necessário. [Flexbox — React Native](https://reactnative.dev/docs/flexbox)

| Direção | Eixo principal | Eixo transversal |
|---|---|---|
| `column` | Vertical | Horizontal |
| `row` | Horizontal | Vertical |

O desenho considera a direção de leitura usual da turma, da esquerda para a direita.

### Experimento guiado

Inserir temporariamente este bloco dentro da tela, com `View` e `Text` já importados:

```tsx
<View style={{ height: 180, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', backgroundColor: '#E2E8F0' }}>
  <View style={{ width: 48, height: 48, backgroundColor: '#DBEAFE' }}><Text>A</Text></View>
  <View style={{ width: 48, height: 48, backgroundColor: '#BFDBFE' }}><Text>B</Text></View>
  <View style={{ width: 48, height: 48, backgroundColor: '#93C5FD' }}><Text>C</Text></View>
</View>
```

1. Prever o resultado e executar.
2. Trocar `row` por `column`.
3. Trocar `space-between` por `center`.
4. Trocar `alignItems` para `flex-start`.

Para distribuir espaço, deve existir espaço livre. Depois da comparação, remover o bloco demonstrativo.

## 4. Adaptar a tela de eventos

O exercício terá duas composições: imagem acima das informações em janela estreita; imagem ao lado delas em janela larga. O limite de 600 é uma decisão didática deste projeto, não uma regra universal para celulares e tablets.

`useWindowDimensions` fornece dimensões atualizadas da janela e acompanha suas mudanças. Chamá-lo dentro do componente, antes do `return`, sem condições ao redor da chamada. [useWindowDimensions — React Native](https://reactnative.dev/docs/usewindowdimensions)

### Etapa A — Consultar a largura

Na importação existente de `react-native`, adicionar `useWindowDimensions`. Dentro de `Index`, antes do `return`, adicionar:

```tsx
const { width } = useWindowDimensions();
const telaLarga = width >= 600;
```

Preservar `mostrarInteresse` e as demais importações da aula 3.

### Etapa B — Reorganizar o cartão

Substituir apenas a `View` do cartão pelo trecho abaixo. O cabeçalho e a `ScrollView` permanecem. Este trecho reutiliza a função e os estilos da aula 3, complementados na etapa C:

```tsx
<View style={[styles.cartao, telaLarga && styles.cartaoLargo]}>
  <Image
    source={{ uri: 'https://reactnative.dev/img/tiny_logo.png' }}
    style={styles.imagem}
    resizeMode="contain"
    accessibilityLabel="Logotipo do React Native, ilustração do encontro"
  />
  <View style={[styles.detalhes, telaLarga && styles.detalhesLargos]}>
    <Text style={styles.nome}>Encontro de Tecnologia</Text>
    <Text style={styles.informacao}>Data: 20 de outubro — evento fictício</Text>
    <Text style={styles.informacao}>Local: auditório do campus</Text>
    <Text style={styles.informacao}>Uma conversa sobre aplicativos e experiências móveis.</Text>
    <Pressable
      accessibilityRole="button"
      accessibilityLabel="Demonstrar interesse no Encontro de Tecnologia"
      onPress={mostrarInteresse}
      style={({ pressed }) => [styles.botao, pressed && styles.botaoPressionado]}
    >
      <Text style={styles.textoBotao}>Tenho interesse</Text>
    </Pressable>
  </View>
</View>
```

### Etapa C — Alterar os estilos

Dentro de `StyleSheet.create`, substituir as entradas existentes `cartao` e `imagem` e acrescentar as três entradas novas. Não deixar duas propriedades com o mesmo nome no objeto:

```tsx
cartao: {
  backgroundColor: '#FFFFFF',
  padding: 20,
  borderRadius: 12,
  gap: 16,
},
cartaoLargo: {
  flexDirection: 'row',
  alignItems: 'flex-start',
},
imagem: {
  width: 96,
  height: 96,
},
detalhes: {
  minWidth: 0,
},
detalhesLargos: {
  flex: 1,
},
```

A mudança tira o espaçamento da imagem e o coloca no contêiner. Em linha, a área de detalhes passa a ocupar o espaço restante. Não fixar a altura do cartão: título e descrição precisam poder crescer.

### Etapa D — Limitar a largura de leitura

Na `View` que envolve o título, a introdução e o cartão, acrescentar `style={styles.conteudo}`. Adicionar ao objeto de estilos:

```tsx
conteudo: {
  width: '100%',
  maxWidth: 800,
  alignSelf: 'center',
},
```

Testar a janela larga e observar que o conteúdo não precisa se estender de ponta a ponta. Os valores deste exercício devem ser revistos conforme os testes.

## 5. Rolagem e áreas seguras

Manter a `ScrollView` para alcançar conteúdo que exceda a altura disponível. Seu `style` configura a própria área de rolagem; `contentContainerStyle` configura o contêiner dos elementos internos. [ScrollView — React Native](https://reactnative.dev/docs/scrollview)

O `paddingTop: 56` da aula 3 era apenas didático. Para tratar recortes e barras do aparelho, o Expo orienta usar `react-native-safe-area-context`. Se necessário, instalar no projeto com:

```powershell
npx expo install react-native-safe-area-context
```

O Expo Router já fornece suporte ao contexto de áreas seguras. Em projetos sem esse contexto, o professor deve configurar `SafeAreaProvider` na raiz antes de utilizar os componentes da biblioteca. [Áreas seguras — Expo](https://docs.expo.dev/develop/user-interface/safe-areas/)

Como demonstração complementar, importar `SafeAreaView` dessa biblioteca e envolver a `ScrollView` com ela, usando `style={{ flex: 1 }}`. Remover o `paddingTop: 56` de `pagina` e manter o espaçamento normal de conteúdo.

Selecionar as bordas conforme o layout existente: com cabeçalho nativo já protegendo o topo, usar `edges={['left', 'right', 'bottom']}`; sem cabeçalho, incluir `'top'`. Se uma barra de navegação inferior já reserva essa área, conferir se o espaçamento inferior está duplicado. O professor deve ensaiar essa configuração no modelo da turma.

## 6. Verificação prática

| Cenário | O que observar |
|---|---|
| Largura abaixo de 600 | Imagem acima dos detalhes. |
| Largura igual ou acima de 600 | Imagem ao lado dos detalhes. |
| Título longo | Quebra de linha sem sair do cartão. |
| Fonte ampliada no sistema | Informações completas e botão alcançável. |
| Conteúdo maior que a altura | Rolagem até o final. |
| Aparelho com barras e recorte | Nenhum elemento essencial encoberto. |

Se a rotação estiver bloqueada, usar outra janela ou dispositivo. Não alterar a configuração de orientação apenas para cumprir a prática. No navegador, verificar o layout; conferir áreas seguras e o alerta nativo no aparelho.

## 7. Erros comuns

- **Alinhamento mudou no sentido inesperado:** conferir primeiro `flexDirection`.
- **Texto saiu do cartão:** verificar largura fixa e o espaço destinado à área de detalhes.
- **Interface não muda de composição:** verificar a largura efetiva da janela e o limite escolhido.
- **Espaçamento ficou exagerado:** procurar combinação de margem, gap e padding.
- **Estilo não teve efeito:** conferir o array e possíveis propriedades sobrescritas.
- **Hook usado fora do componente:** mover a chamada para dentro de `Index`, antes do retorno.

## 8. Fechamento

Pedir que cada dupla apresente uma alteração visual e explique a propriedade responsável. Na aula 5, o cartão organizado nesta prática servirá de base para criar componentes reutilizáveis.

Referências consultadas em 23/09/2026. O exemplo é uma sequência de modificações sobre a aula 3, não um arquivo independente.
