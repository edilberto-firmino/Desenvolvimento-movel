# Conteúdo — Componentes básicos do React Native

## 1. Uma tela é composta por elementos

Na aula 2, executamos o projeto e alteramos um texto. Nesta aula, vamos construir uma tela de apresentação de um evento fictício.

O desenho proposto tem um título, um cartão com imagem e informações e um botão. Cada parte corresponde a componentes no código.

```text
Tela
└── Área de conteúdo
    ├── Título
    ├── Apresentação
    └── Cartão do evento
        ├── Imagem ilustrativa
        ├── Nome do evento
        ├── Data e local
        └── Botão com texto
```

## 2. View: organizar elementos

`View` é um contêiner que pode agrupar outros componentes. Uma tela pode conter várias Views, inclusive uma dentro da outra. Neste exercício, uma agrupa o conteúdo e outra forma o cartão. [Referência: View](https://reactnative.dev/docs/view)

```tsx
<View>
  <Text>Encontro de Tecnologia</Text>
  <Text>Local: campus da faculdade</Text>
</View>
```

Trechos isolados como esse precisam estar dentro do retorno de um componente e ter suas importações. O exemplo completo está na seção 7.

## 3. Text: exibir conteúdo textual

Usar `Text` para títulos, descrições e rótulos. No React Native, não se deve colocar uma frase diretamente dentro de `View` sem envolvê-la em `Text`. [Referência: Text](https://reactnative.dev/docs/text)

```tsx
<Text>Eventos do campus</Text>
```

Uma alteração no tamanho da fonte ajuda a diferenciar título e descrição. A organização detalhada dos estilos será estudada na aula 4.

## 4. Image: apresentar uma imagem

`Image` recebe a origem pela propriedade `source`. Uma imagem remota pode usar `source={{ uri: 'endereço' }}` e deve ter dimensões definidas. `resizeMode="contain"` permite enquadrar toda a imagem na área reservada. [Referência: Image](https://reactnative.dev/docs/image)

No exemplo, usamos o logotipo do React Native como ilustração didática de um encontro de tecnologia. O carregamento depende de acesso à internet.

Para usar uma imagem local, copiar um PNG ou JPG para `assets/images/` e utilizar `require()` com o caminho relativo ao arquivo da tela. Se a tela estiver exatamente em `src/app/index.tsx`, um arquivo `assets/images/evento.png` será referenciado assim:

```tsx
<Image
  source={require('../../assets/images/evento.png')}
  style={{ width: 96, height: 96 }}
  resizeMode="contain"
  accessibilityLabel="Ilustração do evento"
/>
```

Esse arquivo de imagem precisa existir no projeto do aluno. Se a tela estiver em outra pasta, ajustar o caminho; não copiar o caminho relativo sem conferir a estrutura.

## 5. Pressable: responder ao toque

`Pressable` permite reagir à interação do usuário. A propriedade `onPress` recebe uma função. O conteúdo visual do botão pode ser um `Text`, e o estilo pode variar conforme o estado `pressed`. [Referência: Pressable](https://reactnative.dev/docs/pressable)

Comparar:

```tsx
// Correto: entrega a função para executar no toque.
onPress={mostrarInteresse}

// Também correto: entrega uma função que chama outra.
onPress={() => mostrarInteresse()}

// Incorreto neste caso: executa durante a renderização.
onPress={mostrarInteresse()}
```

Essas linhas ilustram propriedades de JSX; não são comandos para o terminal.

## 6. Ler o código antes de copiar

- `import`: traz os componentes e recursos utilizados.
- `export default function`: define o componente exportado pela tela.
- `return`: descreve a interface usando JSX.
- Propriedades: configuram um componente, como `source`, `style` e `onPress`.
- `styles`: reúne os estilos usados no exemplo.

`StyleSheet.create` organiza os objetos de estilo. Aqui usamos apenas cores, tamanhos e espaçamentos básicos. [Referência: StyleSheet](https://reactnative.dev/docs/stylesheet)

## 7. Exemplo completo — Tela de evento

No projeto da aula 2, localizar o arquivo que exibe a tela inicial. No modelo usado como referência, é `src/app/index.tsx`; outros modelos podem usar outra pasta. Guardar o conteúdo anterior fora da pasta de rotas e substituir somente o conteúdo desse arquivo pelo exemplo abaixo. Preservar `_layout.tsx` e os demais arquivos.

O exemplo usa `ScrollView` como apoio para permitir rolagem em telas pequenas. O estudo principal continua sendo os quatro componentes da aula. [Referência: ScrollView](https://reactnative.dev/docs/scrollview)

```tsx
import { Alert, Image, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';

export default function Index() {
  function mostrarInteresse() {
    Alert.alert(
      'Demonstração',
      'Você tocou no botão do Encontro de Tecnologia. Nenhuma inscrição foi realizada.'
    );
  }

  return (
    <ScrollView contentContainerStyle={styles.pagina}>
      <View>
        <Text style={styles.titulo}>Eventos do campus</Text>
        <Text style={styles.introducao}>Conheça o próximo encontro da nossa comunidade.</Text>

        <View style={styles.cartao}>
          <Image
            source={{ uri: 'https://reactnative.dev/img/tiny_logo.png' }}
            style={styles.imagem}
            resizeMode="contain"
            accessibilityLabel="Logotipo do React Native, ilustração do encontro"
          />
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
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  pagina: { padding: 24, paddingTop: 56, paddingBottom: 48, backgroundColor: '#F3F4F6' },
  titulo: { fontSize: 28, fontWeight: 'bold', color: '#111827', marginBottom: 8 },
  introducao: { fontSize: 16, color: '#374151', marginBottom: 24 },
  cartao: { backgroundColor: '#FFFFFF', padding: 20, borderRadius: 12 },
  imagem: { width: 96, height: 96, marginBottom: 16 },
  nome: { fontSize: 22, fontWeight: 'bold', color: '#111827', marginBottom: 12 },
  informacao: { fontSize: 16, color: '#374151', marginBottom: 8 },
  botao: { backgroundColor: '#1D4ED8', padding: 16, borderRadius: 8, marginTop: 16 },
  botaoPressionado: { opacity: 0.75 },
  textoBotao: { fontSize: 16, fontWeight: 'bold', color: '#FFFFFF', textAlign: 'center' },
});
```

`Alert.alert` mostra um diálogo em Android e iOS. A ação é uma demonstração, sem cadastro ou persistência. Não usar a execução no navegador como prova de funcionamento desse alerta nativo. [Referência: Alert](https://reactnative.dev/docs/alert)

Os espaçamentos acima são didáticos. Conferir no aparelho se há sobreposição com barras do sistema; esses valores fixos não substituem um tratamento de áreas seguras para diferentes dispositivos.

## 8. Como verificar

1. Iniciar o projeto como na aula 2, com `npx expo start` dentro da pasta do aplicativo.
2. Conferir título, cartão, imagem e informações.
3. Tocar em “Tenho interesse” no Android ou iOS e conferir a mensagem.
4. Fechar o diálogo e verificar que a tela continua disponível.
5. Alterar o nome do evento tanto na tela quanto na mensagem e repetir o teste.
6. Anotar qualquer problema de corte de conteúdo ou legibilidade para a aula 4.

## 9. Dificuldades frequentes

| Problema | O que conferir |
|---|---|
| Componente não encontrado | Nome com maiúscula e presença no `import`. |
| Erro ao exibir texto | Frase dentro de `Text` e tags fechadas. |
| Imagem remota não aparece | Internet, endereço e dimensões. |
| Imagem local não encontrada | Existência do arquivo, nome e caminho relativo. |
| Mensagem aparece sem tocar | Função passada a `onPress`, sem chamada imediata. |
| Alerta não aparece no navegador | Validar a ação em Android ou iOS. |
| Alteração não aparece | Arquivo da rota correta, salvamento e projeto em execução. |

## 10. Fechamento

Cada componente tem uma responsabilidade: agrupar, apresentar texto, mostrar imagem ou receber interação. Na próxima aula, vamos trabalhar a organização visual dessa tela com estilos e Flexbox.

Referências consultadas em 23/09/2026. O professor deve ensaiar o exemplo no projeto utilizado pela turma antes do encontro.
