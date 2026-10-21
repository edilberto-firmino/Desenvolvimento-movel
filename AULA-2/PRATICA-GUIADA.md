# Prática guiada — Eventos da Turma no Android

**Objetivo:** criar uma interface web simples e executá-la dentro de um aplicativo Android.  
**Ponto de partida:** pasta nova, fora dos projetos Expo anteriores.  
**Resultado:** página com evento e contador de inscrições fictícias.

## 1. Preparar o ambiente

Usaremos Capacitor **8**. A documentação consultada informa Node.js **22 ou superior** e Android Studio **2025.2.1 ou superior**. Para também realizar a extensão com Vite, use Node.js **22.12 ou superior**, em uma linha LTS compatível. Instale Android Studio com SDK e as ferramentas solicitadas pelo projeto; o IDE inclui um JDK adequado. [Ambiente Capacitor](https://capacitorjs.com/docs/getting-started/environment-setup) e [requisitos do Vite](https://vite.dev/guide/).

Antes da aula, no Android Studio:

1. Abra **SDK Manager** e instale a plataforma exigida pelo projeto, além de SDK Platform-Tools e Build-Tools. Para a base Capacitor 8, prepare a API 36; confira a exigência do projeto efetivamente gerado. [Versões Android na base Capacitor 8](https://capacitorjs.com/docs/updating/8-0)
2. Em **Device Manager**, crie um dispositivo virtual com uma imagem Android compatível; para o laboratório, prefira a imagem API 36 previamente testada.
3. Inicie o dispositivo e aguarde a tela do Android. Emulação depende de virtualização disponível no computador.
4. Complete uma compilação de ensaio para baixar dependências antes do encontro.

Os nomes e a localização dos menus podem variar entre versões. Um celular Android físico é alternativa ao emulador: habilite as opções de desenvolvedor e depuração USB, conecte um cabo de dados e autorize o computador no aparelho. Use apenas equipamento autorizado. [Execução Android](https://capacitorjs.com/docs/android)

Abra um terminal PowerShell e confira:

```powershell
node --version
npm --version
```

**Checkpoint:** os dois comandos exibem versões. Se o PowerShell bloquear `npm.ps1`, use `npm.cmd` e `npx.cmd` nos comandos seguintes, sem alterar a política de execução.

## 2. Criar uma pasta nova

No terminal, entre na pasta em que costuma guardar seus projetos e execute um comando por vez:

```powershell
mkdir eventos-capacitor
cd eventos-capacitor
npm init -y
mkdir www
```

Se a pasta já existir, confira seu conteúdo antes de continuar. Não execute novamente a criação dentro de outro projeto.

Abra `eventos-capacitor` no editor. Crie os três arquivos abaixo dentro de `www`. Confirme que o Windows não salvou nomes como `index.html.txt`.

## 3. Criar a estrutura da página

Arquivo **`www/index.html`**:

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
  <title>Eventos da Turma</title>
  <link rel="stylesheet" href="./style.css">
</head>
<body>
  <main>
    <p class="etiqueta">Dispositivos Móveis</p>
    <h1>Eventos da Turma</h1>
    <p>Uma interface web dentro de um aplicativo.</p>

    <article>
      <h2>Oficina de aplicativos</h2>
      <p>Local: laboratório de informática</p>
      <p>Atividade demonstrativa, sem inscrição real.</p>
      <button id="inscrever" type="button">Simular inscrição</button>
      <p id="contador" aria-live="polite">Inscrições simuladas: 0</p>
    </article>

    <p id="mensagem" role="status">Toque no botão para testar.</p>
    <footer>Equipe: informe os nomes dos integrantes</footer>
  </main>
  <script src="./app.js"></script>
</body>
</html>
```

O `head` reúne metadados e a referência ao CSS. O `viewport` ajuda a página a se adaptar à tela. O `id` identifica elementos que o JavaScript vai acessar. O script fica depois dos elementos para que eles já existam quando o código executar.

## 4. Aplicar o estilo

Arquivo **`www/style.css`**:

```css
* { box-sizing: border-box; }

body {
  margin: 0;
  font-family: Arial, sans-serif;
  line-height: 1.5;
  color: #172033;
  background: #eef2f7;
  padding: 24px;
  padding-top: max(24px, env(safe-area-inset-top));
  padding-bottom: max(24px, env(safe-area-inset-bottom));
}

main { max-width: 600px; margin: 0 auto; }
h1 { line-height: 1.2; }
.etiqueta { color: #334b80; font-weight: bold; }

article {
  margin: 24px 0;
  padding: 24px;
  background: white;
  border: 1px solid #cbd5e1;
  border-radius: 16px;
}

button {
  width: 100%;
  min-height: 48px;
  padding: 12px 16px;
  border: 0;
  border-radius: 8px;
  background: #1747a6;
  color: white;
  font: inherit;
  font-weight: bold;
  cursor: pointer;
}

button:focus-visible { outline: 3px solid #a04a00; outline-offset: 4px; }
button:disabled { opacity: 0.65; cursor: wait; }
footer { margin-top: 32px; font-size: 0.9rem; }
```

A largura máxima mantém a leitura confortável no computador. O botão ocupa a largura disponível e tem uma área de toque visível. Teste também a navegação pelo teclado e confira se o conteúdo fica legível em uma janela estreita.

## 5. Programar a interação

Arquivo **`www/app.js`**:

```javascript
let inscricoes = 0;

const botao = document.querySelector('#inscrever');
const contador = document.querySelector('#contador');
const mensagem = document.querySelector('#mensagem');

botao.addEventListener('click', () => {
  inscricoes += 1;
  contador.textContent = `Inscrições simuladas: ${inscricoes}`;
  mensagem.textContent = 'Inscrição simulada! Nenhum dado foi enviado.';
});
```

`let` declara um valor que muda; `querySelector` encontra um elemento; `addEventListener` registra uma ação para o clique; `textContent` altera o texto exibido.

O valor fica apenas na memória da página. Recarregar reinicia o contador. Cada clique representa uma simulação; não identifica pessoas e não impede inscrições repetidas.

## 6. Testar no navegador

Abra `www/index.html` com um navegador. Nesta etapa, não há importações de pacotes nem chamadas de rede, portanto o arquivo local é suficiente.

Teste:

1. O título e o cartão aparecem com estilo.
2. Um clique muda o contador para 1; três cliques mudam para 3.
3. Recarregar a página volta o contador para 0.
4. Diminuir a janela mantém o conteúdo utilizável.

Se o botão não funcionar, abra as ferramentas do desenvolvedor, na aba **Console**, e confira os nomes `app.js`, `inscrever`, `contador` e `mensagem`.

## 7. Instalar e inicializar Capacitor

Volte ao terminal na pasta `eventos-capacitor`, onde está `package.json`:

```powershell
npm install @capacitor/core@8 @capacitor/android@8
npm install -D @capacitor/cli@8
npx cap init "Eventos da Turma" "br.com.exemplo.eventos" --web-dir www
```

Usamos a mesma versão principal para os pacotes Capacitor. Preserve `package-lock.json` após instalar e registre as versões resolvidas. No projeto de referência do professor, mantenha `core`, `android` e CLI alinhados e evite atualizações durante a aula.

Confira o arquivo gerado **`capacitor.config.json`**:

```json
{
  "appId": "br.com.exemplo.eventos",
  "appName": "Eventos da Turma",
  "webDir": "www"
}
```

Se a ferramenta gerar outra extensão de configuração, confira os mesmos campos no arquivo gerado; não mantenha duas configurações concorrentes. [Instalação do Capacitor](https://capacitorjs.com/docs/getting-started)

## 8. Criar e abrir o projeto Android

```powershell
npx cap add android
npx cap sync android
npx cap open android
```

Execute `cap add android` apenas na criação da plataforma. Se `android` já existir, prossiga com a sincronização.

| Comando | Resultado esperado |
|---|---|
| `cap init` | Configuração do aplicativo criada. |
| `cap add android` | Pasta do projeto Android criada. |
| `cap sync android` | Arquivos web copiados e dependências nativas atualizadas. |
| `cap open android` | Projeto aberto no Android Studio. |

No Android Studio:

1. Aguarde a sincronização do Gradle e os downloads.
2. Resolva avisos de SDK ausente instalando o componente indicado.
3. Selecione o emulador preparado ou o celular autorizado na lista de dispositivos.
4. Selecione a configuração do aplicativo, geralmente `app`, e clique em **Run ▶**.
5. Aguarde a instalação e teste o contador na tela Android.

**Checkpoint:** o aplicativo mostra o cartão e responde ao toque no Android. Uma tela do navegador não comprova essa etapa. [Guia Android](https://capacitorjs.com/docs/android)

## 9. Alterar e atualizar

Em `www/index.html`, troque o título visível por **Eventos da Turma — Aula 2** e preencha os nomes da equipe. Salve e recarregue no navegador.

Para atualizar o Android:

```powershell
npx cap sync android
```

Depois clique em **Run ▶** novamente no Android Studio. Neste fluxo, salvar o HTML sozinho não atualiza o aplicativo já instalado. A sincronização também não substitui a execução da nova compilação.

Não edite a cópia gerada dos arquivos web dentro de `android`: ela poderá ser sobrescrita pela próxima sincronização. Edite a origem em `www`. [Fluxo de desenvolvimento](https://capacitorjs.com/docs/basics/workflow)

## 10. Testar sem rede e registrar versões

Com o aplicativo instalado, desligue a conexão de rede do dispositivo de teste e abra-o novamente. O cartão e o contador local devem continuar disponíveis. Isso testa apenas o exemplo local desta aula.

Na pasta do projeto, registre:

```powershell
node --version
npm --version
npm ls @capacitor/core @capacitor/cli @capacitor/android
```

Guarde os resultados para a entrega e reative a conexão depois do teste, se necessário.

## 11. Diagnóstico de dificuldades

| Sintoma | Verificação ou ação |
|---|---|
| `node` não reconhecido | Conferir instalação e reabrir o terminal. |
| `npm.ps1` bloqueado | Usar `npm.cmd` e `npx.cmd`. |
| `package.json` não encontrado | Voltar à pasta raiz do projeto. |
| Pasta de arquivos web ausente | Conferir `webDir: "www"` e a existência de `www/index.html`. |
| Falha ao instalar pacotes | Ler erro completo; conferir rede, versão do Node e permissões. |
| Android já adicionado | Não repetir `add`; executar `sync`. |
| Android Studio não abre | Abrir manualmente a pasta `android` pelo IDE. |
| SDK não encontrado | Configurar o SDK pelo Android Studio e instalar o componente solicitado. |
| Erro de Java/Gradle | Conferir o Gradle JDK nas configurações do IDE e usar o JDK compatível indicado pelo projeto. |
| Emulador indisponível | Conferir imagem, virtualização ou usar aparelho físico. |
| Celular não aparece | Conferir cabo de dados, depuração USB, autorização e drivers quando necessários. |
| Tela sem CSS ou botão inativo | Conferir caminhos, nomes, salvamento e Console. |
| Android mostra texto antigo | Salvar em `www`, sincronizar e executar novamente. |
| Download Gradle demora | Verificar progresso e rede; usar o projeto de demonstração preparado. |

Registre o comando, a mensagem completa e o último passo concluído. Não apague o projeto como primeira tentativa de correção.

## 12. Encerrar e retomar

Guarde a pasta do projeto. Para retomar, abra essa mesma pasta; não execute novamente `npm init` nem `cap add android`.

Se as dependências já estiverem instaladas, edite, sincronize e execute. Em uma cópia limpa que preserve um `package-lock.json` válido, `npm ci` reinstala as dependências registradas. A preparação das ferramentas Android continua necessária.

Você concluiu a etapa básica quando consegue mostrar a página no Android, alterar um texto e explicar o caminho dessa alteração. Depois, siga para [PRATICA-PLUGIN.md](PRATICA-PLUGIN.md).
