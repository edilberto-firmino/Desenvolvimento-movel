# Conteúdo — Primeira aula

## 1. O que vamos estudar

Desenvolver para dispositivos móveis envolve pensar no problema do usuário, na interface em telas pequenas, na interação por toque, na conectividade e nos recursos do aparelho.

A disciplina terá 15 encontros e adotará **React Native com Expo** como eixo prático. O aplicativo será construído aos poucos: interface, interação, navegação, dados, recursos do aparelho e revisão final.

Pergunta central da aula:

> Quais caminhos temos para levar uma solução ao celular de um usuário?

## 2. Principais abordagens

| Abordagem | Exemplos | Ideia principal |
|---|---|---|
| Web móvel e PWA | HTML, CSS e JavaScript | Acesso pelo navegador; uma PWA pode oferecer instalação e funcionamento offline, conforme a implementação e o suporte do ambiente. |
| Web empacotada | Capacitor | Aproveita uma aplicação web dentro de um aplicativo, com integração a recursos nativos. |
| Nativo Android | Kotlin e Jetpack Compose | Desenvolvimento direcionado ao Android. |
| Nativo iOS | Swift e SwiftUI | Desenvolvimento direcionado às plataformas Apple. |
| Multiplataforma | React Native e Flutter | Permite compartilhar parte importante do desenvolvimento entre plataformas, mantendo a necessidade de ajustes específicos. |
| Desenvolvimento visual | FlutterFlow | Ferramenta visual baseada em Flutter para construir aplicações. |

As categorias ajudam a comparar caminhos, mas não são todas mutuamente exclusivas: uma ferramenta visual também pode produzir uma aplicação multiplataforma.

## 3. Diferenças que a turma precisa compreender

### Web responsiva e PWA

Uma interface responsiva se adapta a diferentes tamanhos de tela. Uma PWA acrescenta possibilidades associadas à experiência de aplicação, como instalação e estratégias de uso offline. Ser responsivo, por si só, não significa oferecer essas funcionalidades.

### Nativo e multiplataforma

No desenvolvimento nativo, o projeto é direcionado a uma plataforma e ao seu ecossistema. No multiplataforma, parte do código e do trabalho pode ser compartilhada.

Android nativo continua sendo uma opção a considerar quando os requisitos justificam foco na plataforma ou integração profunda com o aparelho. A escolha por Expo nesta disciplina é uma decisão didática; não significa que os demais caminhos perderam utilidade.

### Flutter e FlutterFlow

Flutter é um framework de desenvolvimento. FlutterFlow é uma ferramenta visual baseada em Flutter. Apresentar os dois como conceitos relacionados, mas diferentes.

## 4. React Native e Expo

**React Native** permite construir interfaces de aplicativos usando React. **Expo** é um framework e um conjunto de ferramentas que facilita o desenvolvimento de projetos React Native.

Mensagem para a turma:

> Vamos usar React Native com Expo para desenvolver um aplicativo ao longo da disciplina. Cada aula acrescentará uma parte ao projeto, enquanto aprendemos a justificar nossas decisões.

Nesta aula, apresentar somente a visão inicial:

- Uma tela é composta por elementos de interface.
- O código define o que será exibido e como o usuário poderá interagir.
- O aplicativo precisa ser executado e observado no aparelho.
- Ferramentas de desenvolvimento ajudam a construir e experimentar a aplicação.

Os detalhes de instalação, comandos e configuração serão preparados para a aula 2, conforme o ambiente disponível.

## 5. Como escolher uma abordagem

Orientar a discussão pelas seguintes perguntas:

- Quem vai usar o aplicativo e em quais aparelhos?
- O acesso precisa ocorrer por link ou exige instalação?
- Quais recursos do aparelho serão necessários?
- O que deve funcionar sem internet?
- Qual é o prazo e o conhecimento da equipe?
- Como a aplicação será distribuída e mantida?

Evitar escolher uma tecnologia apenas por preferência pessoal. Uma justificativa deve ligar as necessidades do projeto às características da abordagem.

## 6. Projeto didático sugerido

Um aplicativo de eventos pode servir como exemplo contínuo. Para a primeira aula, apresentar apenas três telas:

1. **Lista de eventos:** permite conhecer as opções disponíveis.
2. **Detalhes do evento:** apresenta informações sobre uma opção escolhida.
3. **Inscrição:** reúne os campos necessários para demonstrar um formulário.

Perfil, integração com API e leitura de QR Code podem ser discutidos como evoluções futuras. Não são entregas exigidas nesta primeira aula.

## 7. Ideias para retomar no encerramento

- Há diferentes caminhos para construir soluções móveis.
- A escolha depende dos requisitos e das condições do projeto.
- React Native e Expo têm papéis relacionados no desenvolvimento.
- A primeira entrega da turma será uma proposta de fluxo, ainda sem necessidade de programar o aplicativo completo.
