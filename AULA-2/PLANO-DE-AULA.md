# Plano de aula — Web empacotada com Capacitor

**Data prevista:** 30/09/2026  
**Disciplina:** Dispositivos Móveis  
**Formato:** exposição dialogada, demonstração e prática em duplas  
**Premissa de duração:** 180 minutos, ajustável pelo professor.

## Objetivos observáveis

Ao final, o aluno deverá:

1. Explicar web empacotada e identificar o papel da WebView.
2. Relacionar HTML, CSS e JavaScript à interface do aplicativo.
3. Criar uma página interativa e testá-la no navegador.
4. Configurar Capacitor e executar o projeto em Android, quando houver infraestrutura.
5. Alterar a página e demonstrar a atualização após sincronizar e executar novamente.
6. Distinguir código web comum, chamada a plugin e publicação.

## Preparação anterior ao encontro

- [ ] Ler [CONTEUDO.md](CONTEUDO.md) e ensaiar [PRATICA-GUIADA.md](PRATICA-GUIADA.md).
- [ ] Confirmar computadores, projetor, acesso à rede e permissão de instalação.
- [ ] Instalar Node.js compatível e Android Studio conforme a prática.
- [ ] Baixar SDK, ferramentas e imagem do emulador; abrir o emulador ao menos uma vez.
- [ ] Executar uma compilação completa antes da aula para antecipar downloads do Gradle.
- [ ] Ensaiar a [extensão com plugin](PRATICA-PLUGIN.md), se for demonstrá-la.
- [ ] Guardar capturas das etapas e um projeto de referência já testado.
- [ ] Registrar versões reais: Node.js, npm, Capacitor, Android Studio e API do emulador.
- [ ] Separar o gabarito da publicação para a turma.

As três horas pressupõem ferramentas instaladas. Não planejar baixar Android Studio, SDK e emulador do zero em todos os computadores durante a prática.

## Roteiro de 180 minutos

| Tempo | Bloco | Condução e evidência |
|---|---|---|
| 0–10 min | Retomada | Recuperar a tabela da aula 1 e perguntar o que “empacotada” significa. |
| 10–30 min | Conceitos | Explicar WebView, arquivos locais, Capacitor e plugins com o diagrama. |
| 30–45 min | Ambiente | Conferir versões e apresentar a pasta do projeto. |
| 45–80 min | Página web | Construir HTML/CSS/JS; todos devem conseguir clicar e ver o contador. |
| 80–90 min | Intervalo | Deixar a página salva; organizar duplas que precisam de apoio. |
| 90–125 min | Android | Inicializar Capacitor, adicionar Android, sincronizar e executar. |
| 125–145 min | Alteração e desafio | Mudar título e cor; sincronizar; iniciar a atividade avaliativa. |
| 145–165 min | Plugin | Demonstração guiada da confirmação nativa e explicação do novo build web. |
| 165–180 min | Avaliação e síntese | Registrar evidências e aplicar questões selecionadas; demais ficam online. |

Os tempos de instalação e compilação variam. Se o Android atrasar, migrar para a contingência após cerca de 10 minutos de diagnóstico coletivo; registrar a etapa pendente.

## Versão reduzida de 120 minutos

| Bloco | Minutos |
|---|---:|
| Retomada e conceitos | 15 |
| Conferência do ambiente | 10 |
| Página web com códigos fornecidos | 25 |
| Execução Android guiada | 35 |
| Alteração e entrega parcial | 20 |
| Síntese e explicação da atividade online | 15 |

A extensão com plugin fica como demonstração posterior ou estudo orientado. O botão da etapa básica já permite discutir a diferença entre JavaScript web e integração nativa.

## Falas sugeridas e perguntas

**Abertura:** “Na aula anterior vimos uma forma de aproveitar uma aplicação web em um aplicativo. Hoje vamos acompanhar esse caminho e observar o que continua sendo HTML, CSS e JavaScript.”

**Antes do terminal:** “O comando atua na pasta em que o terminal está. Como podemos conferir se estamos no projeto certo?”

**Depois do navegador:** “Já temos uma página funcionando. O que ainda falta para vê-la como aplicativo instalado?”

**Depois do Android:** “A aparência parecida não significa que o HTML virou Kotlin. Qual componente está renderizando essa interface?”

**Depois de editar:** “Por que o navegador mudou, mas o aplicativo ainda mostra o texto antigo?”

**Na demonstração do plugin:** “Qual trecho espera uma resposta da plataforma? O que acontece se a pessoa cancelar?”

**Fechamento:** pedir que uma dupla explique o caminho dos arquivos, do editor até o aplicativo.

## Pontos de observação

| Checkpoint | Evidência | Intervenção |
|---|---|---|
| Página pronta | Contador aumenta no navegador | Conferir nomes, caminhos e Console. |
| Configuração | `webDir` corresponde à pasta usada | Pedir que o aluno mostre o arquivo. |
| Android | App aberto no aparelho ou emulador | Conferir SDK, Gradle e dispositivo selecionado. |
| Atualização | Título novo aparece no Android | Repetir a cadeia editar, sync e executar. |
| Plugin | Cancelar não confirma inscrição | Retomar `await` e o valor de retorno. |

## Contingências

- **Sem Android Studio:** concluir a parte web e observar a demonstração do professor. A validação Android permanece pendente.
- **Computador sem capacidade para emular:** usar aparelho Android físico autorizado ou trabalhar em dupla com máquina preparada.
- **Sem internet:** a página básica pode ser escrita e aberta localmente. Instalações e primeira compilação dependem de arquivos previamente baixados; usar o projeto ensaiado do professor.
- **Turma sem JavaScript prévio:** fornecer os códigos e pedir alterações pequenas. Explicar variável, evento e atualização de texto antes do empacotamento.
- **Turma avançada:** completar a extensão e implementar um botão de zerar o contador, explicando os limites da contagem em memória.

## Avaliação e continuidade

Aplicar a [atividade](ATIVIDADE.md) com a rubrica proposta. Na falta de infraestrutura, avaliar os conceitos e manter o item Android pendente para demonstração posterior, sem registrar execução fictícia.

Usar as [12 questões](QUESTOES-ONLINE.md) como revisão online. O professor pode aplicar quatro oralmente e reservar o conjunto completo para depois da aula.

Antes da aula 3 já planejada, retomar a [preparação do Expo](PLANEJAMENTO-ANTERIOR-EXPO/PLANO-DE-AULA.md). Explicitar que os projetos são separados e que a prática Capacitor serviu para comparar abordagens.
