# Conteúdo — Web empacotada e Capacitor

## 1. O problema que vamos resolver

Imagine que uma instituição já possui uma página de eventos feita com HTML, CSS e JavaScript. Ela quer distribuir um aplicativo para celular aproveitando a interface existente e, depois, integrar funcionalidades do aparelho.

Uma possibilidade é **empacotar a aplicação web** dentro de um projeto móvel. Nesta aula, faremos isso com Capacitor e Android.

Ao final, o aluno deverá conseguir explicar o que foi reaproveitado, o que foi acrescentado e quais etapas continuam necessárias para executar o aplicativo.

## 2. O que significa web empacotada

É uma aplicação cuja interface web é executada dentro de um aplicativo instalado. O conteúdo aparece em uma **WebView**, componente que renderiza páginas web dentro do aplicativo.

O HTML continua descrevendo a estrutura, o CSS continua definindo a apresentação e o JavaScript continua tratando as interações. O empacotamento não traduz automaticamente cada elemento HTML em um componente visual nativo.

**Analogia para a turma:** a página é o conteúdo; o projeto Android é a estrutura que a hospeda; o Capacitor organiza a comunicação entre o código web e a plataforma.

Nesta prática, os arquivos web ficam incluídos no aplicativo. Não estamos apenas abrindo o endereço de um site remoto.

## 3. Papel do Capacitor

Capacitor é um runtime para integrar aplicações web a plataformas como Android e iOS. Ele fornece ferramentas de projeto e uma interface de plugins para chamar funcionalidades da plataforma a partir do JavaScript. Pode ser acrescentado a uma aplicação web existente. [Introdução oficial](https://capacitorjs.com/docs)

Ele não exige que a interface seja criada com Ionic. Ionic é uma opção de ferramentas e componentes de interface; nesta aula usaremos HTML e CSS próprios.

## 4. Caminho de uma interação

```text
Usuário toca em um botão
          ↓
Interface HTML/CSS na WebView
          ↓
JavaScript trata o evento
          ↓
Chamada ao plugin do Capacitor
          ↓
Implementação da plataforma Android
          ↓
Resultado retorna ao JavaScript
          ↓
Interface exibe a resposta
```

O clique que apenas muda um texto na página pode ser tratado pelo próprio JavaScript. Para demonstrar a ponte com a plataforma, a extensão usará um plugin de diálogo. Nem toda interação exige um plugin.

## 5. Comparando abordagens

| Abordagem | Interface | Execução | Exemplo didático |
|---|---|---|---|
| Web responsiva | HTML e CSS adaptados à tela | Navegador | Página de eventos acessada por endereço. |
| PWA | Interface web com recursos adicionais | Ambiente web, com instalação conforme suporte | Aplicação web com estratégia de cache e instalação. |
| Web empacotada | HTML/CSS em WebView | Aplicativo instalado | Página de eventos empacotada com Capacitor. |
| React Native/Expo | Componentes React Native | Aplicativo móvel | Tela construída com `View`, `Text` e `Pressable`. |
| Nativo Android | Ferramentas da plataforma | Aplicativo Android | Interface criada com Kotlin e Jetpack Compose. |

Essas categorias ajudam a comparar decisões; não são todas mutuamente exclusivas. A mesma base web pode atender uma versão de navegador e uma versão empacotada.

**Ligação com a aula 1:** JavaScript pode aparecer em abordagens diferentes. Isso não significa que a interface HTML do Capacitor possa ser copiada diretamente para uma tela React Native.

## 6. O papel das ferramentas

| Ferramenta | Responsabilidade |
|---|---|
| VS Code ou outro editor | Editar arquivos. |
| Terminal | Executar comandos na pasta do projeto. |
| Node.js | Executar ferramentas JavaScript no computador. |
| npm | Instalar dependências e executar scripts do projeto. |
| npx | Executar uma ferramenta fornecida por um pacote. |
| Capacitor CLI | Inicializar configuração, adicionar plataforma e sincronizar. |
| Android Studio | Abrir, compilar, depurar e executar o projeto Android. |
| Android SDK | Fornecer ferramentas e APIs para o desenvolvimento Android. |
| Emulador | Executar um dispositivo Android virtual. |
| Gradle | Coordenar a compilação e dependências do projeto Android. |
| Vite, na extensão | Preparar módulos JavaScript e gerar os arquivos web finais. |

O Node.js instalado no computador não é o mecanismo que renderiza a tela no celular. No aplicativo desta aula, a interface é renderizada pela WebView.

## 7. Arquivos que precisamos reconhecer

```text
eventos-capacitor/
├── package.json
├── package-lock.json
├── capacitor.config.json
├── www/
│   ├── index.html
│   ├── style.css
│   └── app.js
├── node_modules/          # criada pela instalação dos pacotes
└── android/               # criada por cap add android
```

`package.json` descreve pacotes e scripts. `package-lock.json` registra a resolução das dependências, ajudando a reproduzir o ambiente. `www` contém os arquivos web da etapa básica. `android` contém o projeto da plataforma.

No arquivo de configuração do Capacitor:

| Campo | Significado | Exemplo |
|---|---|---|
| `appId` | Identificador técnico do aplicativo | `br.com.exemplo.eventos` |
| `appName` | Nome de apresentação | `Eventos da Turma` |
| `webDir` | Pasta dos arquivos web que serão copiados | `www` |

O identificador é um exemplo didático. Não representa registro de domínio, publicação ou propriedade de uma marca.

Para integrar uma aplicação existente, é necessário ter `package.json`, uma pasta de arquivos web e um `index.html` nessa pasta, com elemento `head`. [Instalação e estrutura exigida](https://capacitorjs.com/docs/getting-started)

## 8. Dois fluxos de desenvolvimento

### Etapa básica: arquivos estáticos

```text
Editar www → testar no navegador → cap sync android → executar no Android
```

Os arquivos já podem ser consumidos pela WebView; não existe script `build` nesta primeira etapa.

### Extensão: módulos e Vite

```text
Editar www → npm run build → gerar dist → cap sync android → executar
```

Agora `webDir` aponta para `dist`. O build prepara os arquivos web; a sincronização os leva ao projeto nativo; a compilação Android produz o aplicativo. São operações distintas. [Fluxo oficial](https://capacitorjs.com/docs/basics/workflow)

## 9. Plugins e integração nativa

Um plugin expõe uma API JavaScript e implementações para as plataformas que suporta. Antes de usá-lo, verificar instalação, compatibilidade, configuração, permissões e comportamento em cada plataforma.

Na extensão, `Dialog.confirm()` apresenta uma confirmação e retorna a escolha do usuário. No Android, permite observar um diálogo nativo; na web, utiliza sua implementação web. Ver a mesma chamada funcionar no navegador não comprova a execução nativa. [API Dialog](https://capacitorjs.com/docs/apis/dialog)

Recursos como câmera e localização exigem estudo das instruções do plugin escolhido. Instalar um pacote não concede automaticamente permissões do sistema nem garante que o usuário as autorize.

## 10. O que funciona sem internet?

Nosso exemplo básico usa arquivos locais e um contador em memória. Depois de instalado, ele pode abrir e contar inscrições fictícias sem buscar dados externos.

Isso não garante que qualquer aplicação empacotada funcione offline. Uma lista carregada de um servidor, imagens remotas e autenticação online continuam dependendo da rede, salvo quando houver uma estratégia específica de armazenamento e sincronização.

O contador da aula é temporário: reiniciar ou recarregar a página perde seu valor. Não há banco de dados nem confirmação real de inscrição.

## 11. Quando considerar essa abordagem

Considere Capacitor quando houver uma interface web aproveitável, uma equipe com experiência web e recursos de plataforma atendidos por plugins ou integrações viáveis.

Antes de decidir, faça um protótipo representativo e avalie fluidez, acessibilidade, teclado, navegação, dispositivos de menor capacidade e recursos nativos necessários. Uma interface com muitas animações ou uma integração especializada pode exigir trabalho adicional. Nenhuma abordagem dispensa testes nos aparelhos de destino.

**Caso para discussão:** uma instituição já possui um catálogo web e quer oferecer uma versão móvel. Que partes podem ser reutilizadas? Que adaptações de toque, tamanho de tela e navegação seriam necessárias?

## 12. Executar não é publicar

Rodar no emulador é uma etapa de desenvolvimento. Distribuir envolve preparação de versão, assinatura, testes e os procedimentos do canal escolhido. Abrir o Android Studio ou executar `cap sync` não publica um aplicativo.

O alvo prático deste encontro é Android. A compilação local de iOS requer macOS e ferramentas Apple, conforme os [requisitos de ambiente](https://capacitorjs.com/docs/getting-started/environment-setup).

## 13. Glossário e revisão oral

| Termo | Explicação breve |
|---|---|
| WebView | Componente que renderiza conteúdo web dentro do aplicativo. |
| Runtime | Infraestrutura usada durante a execução. |
| Plugin | Integração acessível por uma API, com suporte definido por plataforma. |
| Build web | Preparação dos arquivos web finais. |
| Sync | Cópia dos arquivos web e atualização das dependências nativas. |
| Compilação Android | Processo que produz o aplicativo Android. |
| SDK | Conjunto de ferramentas e APIs de desenvolvimento. |
| APK | Formato de pacote de aplicativo Android. |

Perguntas de fechamento: onde a interface é renderizada? O que `webDir` indica? Qual é a diferença entre alterar a página e atualizar o aplicativo instalado? Quando precisamos de um plugin?
