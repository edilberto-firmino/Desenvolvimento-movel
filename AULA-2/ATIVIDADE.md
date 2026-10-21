# Atividade — Personalize e explique seu aplicativo de eventos

**Formato:** individual ou em dupla.  
**Objetivo:** demonstrar o caminho entre uma interface web e um aplicativo Android.  
**Apoio:** [prática guiada](PRATICA-GUIADA.md) e [conteúdo teórico](CONTEUDO.md).

## Situação-problema

A turma vai realizar uma oficina e precisa apresentar seu evento em uma tela de celular. Sua equipe deverá adaptar o exemplo da aula, executar a interface e explicar como o empacotamento funciona.

O botão representa uma simulação. Não é necessário cadastro, login, banco de dados nem envio de informações pessoais.

## Parte 1 — Preparação e identificação

1. Registre os nomes da equipe e a pasta em que salvou o projeto.
2. Registre versões do Node.js, npm e pacotes Capacitor com os comandos da prática.
3. Identifique `package.json`, configuração do Capacitor e a pasta web.
4. Explique qual plataforma está disponível: navegador, Android físico ou emulador.

## Parte 2 — Personalização obrigatória

Na página da prática básica:

1. Escolha um nome de evento e altere seu título.
2. Informe local e uma breve descrição da oficina.
3. Insira os nomes dos integrantes no rodapé.
4. Altere a cor do botão mantendo o texto legível.
5. Preserve o contador e a mensagem de simulação.
6. Teste três cliques e confira o resultado.

Os textos podem ser fictícios. Avalia-se a implementação e a explicação, não o design profissional da página.

## Parte 3 — Empacotamento e atualização

1. Configure Capacitor e adicione Android conforme o roteiro.
2. Sincronize, execute e mostre a interface no dispositivo.
3. Faça uma segunda alteração visível: acrescente “Versão 2” ao título da página.
4. Atualize o aplicativo pelo fluxo correto da etapa que estiver usando.
5. Compare o texto anterior com o novo e explique por que salvar sozinho não bastou.

Se não houver infraestrutura Android, conclua a versão web e registre a etapa nativa como **pendente por infraestrutura**, incluindo o motivo. A observação da demonstração do professor pode apoiar a explicação, mas não equivale à execução da sua equipe.

## Parte 4 — Respostas escritas

Responda em duas a quatro frases por questão:

1. O que é WebView e qual seu papel neste projeto?
2. Quais responsabilidades têm HTML, CSS e JavaScript no exemplo?
3. Para que servem `appId`, `appName` e `webDir`?
4. Qual a diferença entre `cap add android`, `cap sync android` e `cap open android`?
5. O contador precisa de plugin? O que muda quando usamos `Dialog.confirm()`?
6. A aplicação básica pode funcionar sem internet? Justifique sem generalizar para todos os aplicativos.
7. O que acontece com o contador ao recarregar a página e por quê?
8. Executar no emulador significa publicar? Explique.

## Parte 5 — Extensão opcional

Siga [PRATICA-PLUGIN.md](PRATICA-PLUGIN.md). Demonstre que confirmar incrementa o contador e cancelar mantém o valor. Explique por que `webDir` mudou para `dist` e onde entra `npm run build`.

Essa parte pode ser feita em outro encontro. Não é exigida na rubrica básica de 10 pontos.

## Entrega

Entregue um documento ou postagem contendo:

- Integrantes, versões e caminho da pasta do projeto.
- Arquivos `www/index.html`, `www/style.css`, `www/app.js`, configuração do Capacitor, `package.json` e `package-lock.json`.
- Captura da interface personalizada e da versão atualizada; indique navegador, emulador ou aparelho físico em cada evidência. A demonstração ao vivo pode substituir capturas a critério do professor.
- Respostas da parte 4.
- Um registro de dificuldade, sua investigação e solução; se nenhuma ocorreu, explique uma verificação preventiva realizada.
- Pendências e motivo, quando aplicável.

Não é necessário entregar `node_modules`, artefatos de compilação ou a pasta gerada `android` nesta atividade introdutória. Preserve o projeto completo no computador para demonstração. O prazo será definido pelo professor na plataforma.

## Rubrica sugerida — 10 pontos

| Critério | Pontos | Evidência para pontuação integral |
|---|---:|---|
| Organização e ambiente | 1,0 | Identifica arquivos, pasta e versões. |
| Interface personalizada | 2,0 | Apresenta título, local, descrição, integrantes e estilo legível. |
| Interação web | 2,0 | Contador funciona e aluno explica seu estado temporário. |
| Execução e atualização Android | 2,0 | Mostra aplicativo e segunda alteração aplicada pelo fluxo correto. |
| Compreensão conceitual | 2,0 | Respostas distinguem WebView, configuração, plugins e publicação. |
| Evidências e diagnóstico | 1,0 | Entrega identifica plataforma e documenta verificações ou dificuldades. |
| **Total** | **10,0** | |

Para trabalho parcial, atribuir pontos proporcionais às evidências do critério. Se o item Android estiver bloqueado por infraestrutura, manter seus 2 pontos pendentes para demonstração posterior ou definir previamente uma avaliação alternativa; não confundir o bloqueio técnico com falta de compreensão.
