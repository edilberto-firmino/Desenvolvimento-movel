# Conteúdo — Ambiente e primeiro projeto Expo

## 1. Da ideia ao projeto

Na aula 1, discutimos caminhos para desenvolver aplicativos e desenhamos três telas. Agora vamos preparar as ferramentas e executar a base do aplicativo.

**Meta de hoje:** conseguir criar, abrir, modificar e executar um projeto. O desenho completo das telas será desenvolvido nas próximas aulas.

## 2. O papel de cada ferramenta

| Ferramenta ou conceito | Papel nesta aula |
|---|---|
| Editor de código | Permite abrir a pasta e editar os arquivos. Pode ser o VS Code ou outro editor disponível. |
| Terminal | Recebe os comandos; sua pasta atual determina onde eles atuam. |
| Node.js | Executa ferramentas JavaScript no computador durante o desenvolvimento. |
| npm | Gerencia os pacotes usados pelo projeto. |
| npx | Executa ferramentas de linha de comando fornecidas por pacotes. |
| React Native | Base para construir a interface do aplicativo com React. |
| Expo | Framework e ferramentas usados no desenvolvimento do projeto. |

O computador prepara e serve o projeto durante o desenvolvimento. O celular permite observar e testar sua interface.

## 3. Escolher onde executar

Nesta aula, a proposta é usar **Expo Go em um celular**. Ele serve para aprendizado e experimentação com os recursos que já inclui. Uma *development build* é uma compilação do próprio aplicativo com ferramentas de desenvolvimento, necessária para cenários que ultrapassem essas possibilidades. [Configuração do ambiente — Expo](https://docs.expo.dev/get-started/set-up-your-environment/)

Abrir o projeto no Expo Go não equivale a publicar um aplicativo nas lojas. Para explicar as limitações e a evolução futura do projeto, consultar [Introduction to development builds](https://docs.expo.dev/develop/development-builds/introduction/).

## 4. Preparar o computador

Utilizar **Node.js LTS**, um editor e uma pasta de trabalho para os aplicativos da turma. O Expo oferece suporte ao desenvolvimento em Windows, macOS e Linux. [Requisitos oficiais](https://docs.expo.dev/get-started/create-a-project/)

Depois da instalação do Node.js, abrir um novo terminal e conferir:

```powershell
node --version
npm --version
```

Os comandos devem retornar números de versão. Se não forem reconhecidos, verificar a instalação e reabrir o terminal antes de continuar.

No laboratório, seguir as permissões da instituição. No Windows, se apenas o script `npm.ps1` estiver bloqueado, é possível testar `npm.cmd --version` e usar `npx.cmd` no lugar de `npx`, sem alterar a política de execução.

## 5. Criar o projeto

Abrir o terminal na pasta escolhida para guardar os aplicativos. Executar:

```powershell
npx create-expo-app@latest eventos-mobile
```

O comando cria a pasta `eventos-mobile` a partir do modelo padrão. Aguardar o término e ler as mensagens antes de continuar. Caso a pasta já contenha um projeto, abrir esse projeto em vez de tentar criá-lo novamente com o mesmo nome. [Criação de projetos](https://docs.expo.dev/get-started/create-a-project/)

Entrar na pasta criada:

```powershell
cd eventos-mobile
```

Abrir essa mesma pasta no editor usando **Arquivo → Abrir pasta**. O nome `eventos-mobile` é apenas a sugestão didática desta aula.

O gerador oferece modelos diferentes; por isso, projetos criados com outras opções podem apresentar outra organização. A turma deve seguir o modelo testado pelo professor. [Referência do create-expo-app](https://docs.expo.dev/more/create-expo/)

## 6. Iniciar e abrir no celular

Dentro da pasta do projeto:

```powershell
npx expo start
```

Manter o terminal aberto. Usar o QR Code exibido para abrir o projeto no celular com Expo Go. Computador e aparelho devem conseguir se comunicar pela rede. Para iPhone físico, a documentação consultada exige a mesma conta Expo na CLI e no Expo Go; quando necessário, executar `npx expo login` e entrar com essa conta no aparelho. [Primeira execução](https://docs.expo.dev/get-started/start-developing/)

Antes do encontro, o professor deve testar a compatibilidade entre o projeto e o Expo Go instalado. Não assumir que atualizar somente um deles resolve qualquer incompatibilidade.

## 7. Reconhecer a estrutura

Localizar no editor:

| Item | O que observar |
|---|---|
| `src/app/` | No modelo atual, contém os arquivos de rotas e telas. |
| `src/components/` | Componentes usados na interface. |
| `assets/` | Recursos como imagens. |
| `app.json` | Configuração da aplicação. |
| `package.json` | Pacotes e comandos do projeto. |
| `tsconfig.json` | Configuração do TypeScript. |

No guia atual, a primeira edição ocorre em `src/app/index.tsx`. Outros modelos podem usar `app/` ou agrupar telas em subpastas. Identificar o arquivo que efetivamente gera a tela exibida. [Estrutura e primeira alteração](https://docs.expo.dev/get-started/start-developing/)

O modelo padrão utiliza TypeScript; a extensão `.tsx` aparece em arquivos que combinam código TypeScript e marcação de interface. Nesta aula, basta reconhecer esses arquivos e editar um texto. [Tutorial oficial](https://docs.expo.dev/tutorial/introduction/)

## 8. Fazer a primeira alteração

No arquivo da tela inicial, localizar um texto visível e trocar seu conteúdo por:

> Meu primeiro aplicativo de eventos

Preservar as tags, importações e demais estruturas existentes. Salvar e observar o aparelho. Depois, acrescentar ao mesmo texto o nome da dupla e conferir novamente.

Perguntar ao aluno: “Como você sabe que editou o arquivo certo?” A evidência é a mudança aparecer na tela que está sendo executada.

Como leitura opcional, observar um componente simples no [exemplo introdutório do Expo](https://docs.expo.dev/tutorial/introduction/). A construção de novos componentes será tema da aula 3.

## 9. Dificuldades comuns

| Situação | Verificação inicial |
|---|---|
| `node` ou `npm` não reconhecido | Conferir instalação do Node.js e abrir novo terminal. |
| Comando não encontra o projeto | Confirmar se a pasta atual contém `package.json`. |
| Criação interrompida | Ler a mensagem completa e verificar conexão e permissões da pasta. |
| QR Code não abre o aplicativo | Conferir conexão, Expo Go e compatibilidade de versões. |
| Erro de conta no iPhone | Conferir a conta na CLI e no Expo Go. |
| Texto não mudou | Confirmar arquivo, salvamento e projeto aberto no aparelho. |
| Erro depois de editar | Revisar a última alteração e as tags ao redor do texto. |

Se a rede impedir a comunicação direta, interromper o servidor com `Ctrl+C` e tentar, com acesso à internet:

```powershell
npx expo start --tunnel
```

O túnel pode ser mais lento. As instruções de conexão e conta estão no [guia de execução do Expo](https://docs.expo.dev/get-started/start-developing/).

Se faltar aparelho, o professor pode orientar a execução web oferecida pelo projeto como alternativa provisória. Registrar em qual plataforma a prática foi feita; o teste no navegador não comprova o comportamento no celular.

## 10. Encerrar e retomar

Encerrar o servidor com `Ctrl+C`. Guardar a pasta do projeto. Na próxima aula, abrir o terminal nessa mesma pasta e iniciar novamente com `npx expo start`; não é necessário criar outro aplicativo.

**Pergunta de saída:** qual é a diferença entre criar um projeto, iniciar o servidor e editar uma tela?

Documentação consultada em 23/09/2026. Os procedimentos devem ser ensaiados pelo professor no ambiente da instituição antes da aula.
