# Gabarito comentado — Aula 2

**Material do professor.** Publicar para a turma somente após o encerramento da atividade, se esse for o procedimento adotado.

## Respostas objetivas

| Questão | Alternativa | Justificativa |
|---|:---:|---|
| 1 | B | A interface web é reaproveitada em uma WebView; integração com a plataforma pode ser feita por plugins. |
| 2 | D | A WebView renderiza a interface web dentro do aplicativo. |
| 3 | A | HTML organiza o conteúdo, CSS define apresentação e JavaScript implementa interações. |
| 4 | C | `webDir` indica a pasta dos arquivos web usados na sincronização. |
| 5 | B | A alteração deve ser salva, sincronizada e executada na nova versão Android. |
| 6 | D | `cap open android` abre o projeto no IDE; não o publica nem garante sua execução. |
| 7 | A | Incrementar uma variável e alterar o DOM são operações JavaScript comuns. |
| 8 | C | Os arquivos e a interação locais não exigem rede; dependências remotas precisam de análise própria. |
| 9 | B | O valor só existe na memória da página; não foi implementada persistência. |
| 10 | D | Emulador é ambiente de teste. Publicação exige um processo adicional. |
| 11 | A | O build gera `dist`, sync copia essa saída e a nova execução aplica a versão ao dispositivo. |
| 12 | C | O ramo de cancelamento retorna antes do incremento e `finally` reativa o botão. |

## Uso diagnóstico

- Erros nas questões 1–3: retomar WebView e os papéis das tecnologias.
- Erros nas questões 4–6 e 11: pedir que o aluno desenhe o caminho dos arquivos e explique cada comando.
- Erros nas questões 7 e 12: comparar o clique básico com a chamada ao plugin.
- Erros nas questões 8–10: retomar rede, estado em memória e diferença entre testar e publicar.

Se converter a atividade online para uma escala de 0 a 10 com pesos iguais, usar `nota = acertos / 12 × 10` e definir o arredondamento na plataforma. A rubrica da prática é uma avaliação separada; qualquer composição de notas deve ser comunicada à turma.

## Respostas esperadas da atividade prática — Parte 4

1. **WebView:** componente que renderiza conteúdo web dentro do aplicativo. Neste projeto, apresenta o HTML/CSS e permite executar as interações JavaScript da interface.
2. **Tecnologias:** HTML define títulos, cartão e botão; CSS define cores, espaçamento e dimensões; JavaScript trata o clique e atualiza a contagem.
3. **Configuração:** `appId` identifica tecnicamente o aplicativo; `appName` define o nome de apresentação; `webDir` aponta para os arquivos web finais que serão sincronizados.
4. **Comandos:** `add` cria o projeto da plataforma; `sync` copia os arquivos web e atualiza dependências nativas; `open` abre o projeto no Android Studio. Executar exige a etapa seguinte no IDE ou ferramenta equivalente.
5. **Plugin:** o contador básico não precisa de integração nativa. `Dialog.confirm()` utiliza a API do plugin para obter a decisão do usuário, com implementação apropriada à plataforma.
6. **Offline:** o exemplo básico usa arquivos locais e não consulta serviços remotos, então sua interação pode funcionar sem rede após instalação. Aplicativos que consultam um servidor não recebem funcionamento offline completo apenas pelo empacotamento.
7. **Contador:** recarregar reinicia a variável porque não existe banco de dados ou outro mecanismo de persistência no exemplo.
8. **Publicação:** executar no emulador serve para desenvolver e testar; não realiza distribuição pública ou publicação em loja.

Aceitar respostas equivalentes com palavras próprias. Pedir evidência quando o aluno afirmar que executou determinada plataforma.

## Conferência do desafio prático

| Item | Como conferir |
|---|---|
| Personalização | Comparar título, descrição, local, equipe e cor com o exemplo inicial. |
| Interação | Recarregar; clicar três vezes; observar o valor 3 e a mensagem de simulação. |
| Atualização Android | Pedir “Versão 2” na tela Android e a explicação da sincronização. |
| Limites da simulação | Aluno reconhece ausência de persistência e de inscrição real. |
| Extensão opcional | Confirmar incrementa; cancelar preserva o valor; botão volta a funcionar. |

O código-base de referência está na [prática guiada](PRATICA-GUIADA.md); a solução da integração está na [extensão com plugin](PRATICA-PLUGIN.md). As personalizações são abertas e não possuem uma única combinação correta de textos e cores.
