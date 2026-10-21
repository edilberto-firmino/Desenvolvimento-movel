# Plano de aula 2

**Disciplina:** Dispositivos Móveis  
**Tema:** Preparação do ambiente e estrutura de um projeto Expo  
**Duração:** ajustar ao encontro  
**Continuidade:** colocar em prática o primeiro contato com Expo realizado na aula 1

## Objetivos de aprendizagem

Ao final do encontro, o aluno deverá conseguir:

- Identificar o papel do editor, do terminal, do Node.js e das ferramentas do Expo.
- Criar um projeto e iniciar seu servidor de desenvolvimento.
- Executar o aplicativo em um dispositivo disponível.
- Localizar a tela inicial e os principais arquivos de configuração.
- Alterar um texto, salvar e verificar o resultado.
- Registrar uma dificuldade técnica com informações suficientes para receber ajuda.

## Preparação do professor

1. Conferir disponibilidade de computadores, celulares, internet e permissões para instalar ferramentas no laboratório.
2. Preparar Node.js LTS e um editor de código nas máquinas, quando possível antes do encontro.
3. Seguir o passo a passo do CONTEUDO.md em uma máquina representativa do laboratório.
4. Verificar se a versão do projeto criado é compatível com o Expo Go dos aparelhos da turma.
5. Testar a conexão entre computador e celular na rede da instituição.
6. Guardar um projeto de demonstração funcional e imagens da execução para eventual contingência.
7. Identificar no projeto testado o caminho exato da tela inicial e apresentá-lo à turma.

O modelo padrão pode mudar com atualizações. Registrar a versão de `expo` presente em `package.json` no projeto de referência. Não atualizar ferramentas no meio da aula sem necessidade.

## Roteiro sugerido

| Etapa | Tempo proporcional | Ação do professor | Resultado do aluno |
|---|---:|---|---|
| Retomada | 10% | Recuperar a proposta de três telas da aula 1. | Relacionar o projeto ao problema escolhido. |
| Mapa das ferramentas | 15% | Explicar editor, terminal, Node.js, npm, npx e Expo Go. | Distinguir escrever, preparar e executar o projeto. |
| Preparação e criação | 25% | Demonstrar os comandos e acompanhar as duplas. | Criar e abrir a pasta do aplicativo. |
| Primeira execução | 20% | Ajudar a abrir o aplicativo e verificar conexão. | Observar a tela inicial. |
| Exploração e alteração | 20% | Apresentar os arquivos e orientar uma mudança de texto. | Ver a alteração refletida na aplicação. |
| Registro e fechamento | 10% | Recolher evidências e dúvidas. | Explicar o caminho entre editar e visualizar. |

## Perguntas para conduzir a explicação

- Em qual pasta o terminal está agora?
- Qual comando cria o projeto e qual inicia um projeto que já existe?
- Qual arquivo contém o texto que estamos vendo?
- O que acontece quando salvamos uma alteração?
- Abrir o projeto no Expo Go significa que já publicamos um aplicativo?

## Estratégia para turmas iniciantes

Executar um comando de cada vez e esperar o resultado. Explicar como abrir o terminal na pasta correta. Trabalhar em duplas, alternando quem digita e quem confere o procedimento.

Se a turma ainda não conhece JavaScript, limitar a edição a textos existentes. Usar esta aula para diagnosticar a necessidade de uma retomada de funções, importações e marcação de interface na aula seguinte.

## Contingências

- **Poucos celulares:** organizar rodízio ou duplas com um aparelho disponível.
- **Sem aparelho compatível:** usar a execução web, quando disponível no projeto, e registrar a validação no celular como pendente.
- **Rede isolando os dispositivos:** seguir o diagnóstico de conexão do conteúdo; testar túnel se permitido pela rede.
- **Instalações bloqueadas:** usar as máquinas previamente preparadas ou a demonstração do professor; registrar quem ainda precisa concluir a prática.
- **Sem internet e sem ambiente preparado:** trabalhar o mapa de arquivos e a sequência dos comandos com o material demonstrativo. Essa alternativa não comprova execução individual.

## Avaliação formativa

Conferir a execução, a alteração de texto e a explicação sobre os arquivos. Separar dificuldades de infraestrutura de dificuldades de compreensão. Não há peso de nota definido neste planejamento.

## Ponte para a aula 3

Pedir que os alunos preservem o projeto e anotem onde ele foi salvo. A aula 3 utilizará essa base para estudar `View`, `Text`, `Image` e `Pressable` e iniciar a composição da tela do aplicativo.
