# Aula 2 — Da página web ao aplicativo Android com Capacitor

**Disciplina:** Dispositivos Móveis  
**Aula prevista:** 30/09/2026  
**Público:** iniciantes, com retomada de HTML, CSS e JavaScript  
**Duração sugerida:** 3 horas, incluindo intervalo; adaptação para 2 horas no plano.

**Resultado esperado:** construir uma página de eventos, empacotá-la como aplicativo Android, alterar seu conteúdo e explicar como o Capacitor conecta a interface web a recursos nativos.

## Por onde começar

| Material | Utilização |
|---|---|
| [Plano de aula](PLANO-DE-AULA.md) | Preparação, cronograma, falas e condução do professor. |
| [Conteúdo teórico](CONTEUDO.md) | Conceitos, comparações, arquitetura e glossário. |
| [Prática guiada](PRATICA-GUIADA.md) | Passo a passo completo e códigos para copiar no editor. |
| [Integração com plugin](PRATICA-PLUGIN.md) | Extensão com Vite e um diálogo nativo de confirmação. |
| [Atividade avaliativa](ATIVIDADE.md) | Desafio, evidências de entrega e rubrica de 10 pontos. |
| [Questões online](QUESTOES-ONLINE.md) | 12 questões objetivas, sem respostas, para a turma. |
| [Gabarito comentado](GABARITO-QUESTOES-ONLINE.md) | Respostas, justificativas e orientação para a prática. |

## Organização do encontro

1. Retomar a expressão **web empacotada** apresentada na aula 1.
2. Construir e testar uma interface no navegador.
3. Adicionar Capacitor e executar no Android.
4. Modificar a página e repetir a sincronização.
5. Demonstrar a integração nativa e avaliar a compreensão.

A etapa básica usa arquivos estáticos em `www`, sem etapa de build web. A extensão com plugin introduz o Vite, gera `dist` e muda o fluxo para **editar → build → sync → executar**. Não misturar os dois fluxos antes de concluir a prática básica.

## Preparação para amanhã

- Ler o plano e ensaiar a prática no computador que será usado na aula.
- Instalar as ferramentas Android e baixar a imagem do emulador previamente.
- Deixar uma demonstração Android disponível, pois a instalação inicial pode consumir o encontro.
- Separar o gabarito do material publicado para os alunos.
- Registrar as versões efetivamente testadas e as limitações da infraestrutura.

## Continuidade da disciplina

Esta aula aprofunda a abordagem Capacitor citada na aula 1. O planejamento anterior de Expo foi preservado integralmente em [PLANEJAMENTO-ANTERIOR-EXPO](PLANEJAMENTO-ANTERIOR-EXPO/README.md).

As aulas seguintes existentes usam React Native/Expo. O projeto Capacitor não é uma base diretamente compatível com os componentes `View` e `Text`. Antes de seguir para a aula 3, reservar a preparação do projeto Expo descrita no planejamento anterior. Esta aula funciona como laboratório comparativo dentro do curso.

## Referência e limite de validação

Documentação oficial consultada em **29/09/2026**, tendo Capacitor 8 como referência. Os exemplos são material didático; a execução Android deve ser ensaiada no ambiente real do professor. O material não implica que um APK tenha sido compilado ou publicado.
