# Atividade online — Aula 2: Web empacotada com Capacitor

**Orientações:** responda às 12 questões. Cada questão possui quatro alternativas e apenas uma resposta correta. As duas últimas também retomam a demonstração do plugin. Não é necessário executar comandos para responder.

## Questão 1

Uma instituição já tem uma aplicação HTML/CSS/JavaScript e quer aproveitá-la dentro de um aplicativo instalado. Qual descrição corresponde à abordagem estudada?

A) Reescrever obrigatoriamente toda a interface em Kotlin.
B) Executar a interface web em uma WebView dentro do aplicativo, com possibilidade de integração nativa.
C) Transformar automaticamente cada tag HTML em um componente React Native.
D) Salvar a página como uma imagem e usá-la como tela do aplicativo.

## Questão 2

Qual é a função da WebView no exemplo da aula?

A) Gerenciar a instalação dos pacotes npm.
B) Compilar o projeto Android.
C) Publicar o aplicativo na loja.
D) Renderizar a interface web dentro do aplicativo.

## Questão 3

Na etapa básica, qual alternativa associa corretamente as tecnologias utilizadas?

A) HTML estrutura a página, CSS define sua apresentação e JavaScript trata as interações.
B) HTML compila Android, CSS instala pacotes e JavaScript substitui o SDK.
C) HTML armazena inscrições no servidor, CSS fornece permissões e JavaScript publica o aplicativo.
D) HTML, CSS e JavaScript têm a mesma função e podem ser usados indistintamente.

## Questão 4

A configuração contém `"webDir": "www"`. O que isso indica?

A) O endereço da loja em que o aplicativo será publicado.
B) O nome da conexão de rede do dispositivo.
C) A pasta dos arquivos web que o Capacitor utilizará na sincronização.
D) A pasta obrigatória do SDK Android.

## Questão 5

A equipe já executou `cap add android` e concluiu a etapa básica, sem Vite. Ela alterou `www/index.html`, mas o aplicativo continua com o texto anterior. Qual procedimento é adequado?

A) Criar novamente todo o projeto com `npm init`.
B) Salvar o arquivo, executar `npx cap sync android` e executar novamente pelo Android Studio.
C) Trocar apenas o nome da pasta `node_modules`.
D) Executar `cap add android` a cada alteração de texto.

## Questão 6

Qual ação é realizada por `npx cap open android`?

A) Publicar o aplicativo automaticamente.
B) Substituir a necessidade de SDK e compilação.
C) Gerar a página HTML a partir de Kotlin.
D) Abrir o projeto Android no Android Studio.

## Questão 7

O botão básico incrementa uma variável e altera um texto na página. Qual análise é correta?

A) Essa interação pode ser realizada pelo JavaScript da página, sem plugin nativo.
B) Todo clique em aplicativo empacotado exige plugin de câmera.
C) Alterar um texto exige uma conta de publicação Android.
D) O contador é automaticamente gravado em um servidor pelo Capacitor.

## Questão 8

Depois de instalado, o exemplo básico contém apenas arquivos locais e um contador em memória. O que se pode afirmar sobre seu uso sem internet?

A) Nenhum aplicativo com HTML consegue abrir sem internet.
B) Isso comprova que qualquer aplicativo Capacitor funciona integralmente offline.
C) Essa interação local pode funcionar sem rede, mas recursos remotos de outros aplicativos podem depender de conexão.
D) O empacotamento transforma automaticamente serviços remotos em bancos de dados locais.

## Questão 9

Após recarregar a página básica, o contador volta para zero. Por quê?

A) O Android proíbe números maiores que zero em páginas web.
B) O valor estava apenas em uma variável de memória, sem mecanismo de persistência.
C) O CSS apaga todas as inscrições de um servidor.
D) O Capacitor publica uma versão nova a cada clique.

## Questão 10

Uma dupla mostrou o aplicativo em um emulador. Isso significa que ele já está publicado?

A) Sim, todo emulador envia automaticamente o aplicativo à loja.
B) Sim, a pasta `android` comprova distribuição pública.
C) Sim, qualquer execução de `cap sync` publica uma versão.
D) Não; execução de desenvolvimento e publicação são etapas distintas.

## Questão 11

Na extensão com Vite, `www` contém os fontes e `dist` contém os arquivos gerados. Qual sequência aplica uma alteração ao Android?

A) Editar fontes, executar `npm run build`, executar `npx cap sync android` e rodar novamente no Android Studio.
B) Editar somente `dist` e apagar `www`.
C) Executar apenas `npm run dev` e considerar o aplicativo instalado atualizado.
D) Alterar `webDir` para `node_modules` e publicar.

## Questão 12

Na extensão, `Dialog.confirm()` devolveu `value: false`. Qual comportamento foi programado?

A) Incrementar o contador duas vezes.
B) Excluir o aplicativo do aparelho.
C) Exibir a mensagem de cancelamento, manter o contador e reativar o botão.
D) Salvar uma inscrição real no servidor.
