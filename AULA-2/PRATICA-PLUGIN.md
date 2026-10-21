# Extensão — Confirmar uma inscrição com um diálogo nativo

**Pré-requisito:** concluir a [prática básica](PRATICA-GUIADA.md).  
**Formato sugerido:** demonstração de 20 minutos pelo professor ou atividade adicional.  
**Objetivo:** observar uma chamada JavaScript que utiliza a implementação de um plugin no Android.

## 1. Por que mudar o fluxo?

Na etapa básica, usamos JavaScript direto, sem importações de pacotes. Agora vamos importar `@capacitor/dialog`. Um navegador não resolve sozinho esse nome de pacote em um arquivo aberto por duplo clique.

Usaremos Vite para resolver os módulos e gerar os arquivos web finais. A pasta `www` passa a ser a origem; `dist` será a saída de build e a nova origem da sincronização do Capacitor. [Guia Vite](https://vite.dev/guide/)

## 2. Instalar os pacotes e configurar scripts

Dentro de `eventos-capacitor`, com Node.js 22.12 ou superior em uma linha compatível:

```powershell
npm install @capacitor/dialog@8
npm install -D vite@7
npm pkg set "scripts.dev=vite www"
npm pkg set "scripts.build=vite build www --outDir ../dist"
```

O plugin oferece diálogos de alerta, confirmação e entrada. Usaremos `confirm()`, cujo resultado inclui `value`, indicando a escolha. [Documentação Dialog](https://capacitorjs.com/docs/apis/dialog)

O diretório de saída `../dist` é relativo à raiz web `www`, portanto será criado ao lado dela, dentro do projeto. Use `dist` apenas para arquivos gerados; não guarde documentos próprios nessa pasta.

## 3. Preparar o HTML para módulos

Em `www/index.html`, substitua apenas a linha do script:

```html
<script type="module" src="./app.js"></script>
```

Mantenha os demais elementos, incluindo os IDs usados na prática básica.

## 4. Substituir o JavaScript

Substitua todo o conteúdo de `www/app.js` por:

```javascript
import { Dialog } from '@capacitor/dialog';

let inscricoes = 0;

const botao = document.querySelector('#inscrever');
const contador = document.querySelector('#contador');
const mensagem = document.querySelector('#mensagem');

botao.addEventListener('click', async () => {
  botao.disabled = true;

  try {
    const resultado = await Dialog.confirm({
      title: 'Confirmar simulação',
      message: 'Deseja simular uma inscrição nesta oficina?',
      okButtonTitle: 'Confirmar',
      cancelButtonTitle: 'Cancelar'
    });

    if (!resultado.value) {
      mensagem.textContent = 'Operação cancelada. O contador não mudou.';
      return;
    }

    inscricoes += 1;
    contador.textContent = `Inscrições simuladas: ${inscricoes}`;
    mensagem.textContent = 'Simulação confirmada! Nenhum dado foi enviado.';
  } catch (erro) {
    mensagem.textContent = 'Não foi possível abrir a confirmação. Tente novamente.';
    console.error('Falha no diálogo:', erro);
  } finally {
    botao.disabled = false;
  }
});
```

`async` permite usar `await`, que aguarda o resultado da chamada. Se o usuário cancelar, saímos antes de aumentar o contador. `catch` trata falhas; `finally` reativa o botão mesmo após cancelamento ou erro.

O diálogo não salva dados e não transforma a simulação em uma inscrição real.

## 5. Testar a versão web

```powershell
npm run dev
```

Abra o endereço exibido pelo Vite. Use esse endereço nesta etapa, não o duplo clique em `index.html`. Confirme e cancele para verificar as duas respostas. Encerre o servidor com `Ctrl+C` quando terminar.

Na web, a aparência e os rótulos do diálogo podem depender do navegador; no Android instalado, observa-se a implementação nativa. Não usar apenas a aparência do navegador como evidência de teste Android.

## 6. Atualizar a configuração do Capacitor

Em `capacitor.config.json`, altere `webDir` para `dist`:

```json
{
  "appId": "br.com.exemplo.eventos",
  "appName": "Eventos da Turma",
  "webDir": "dist"
}
```

Se sua configuração tiver outra extensão, altere o campo equivalente no arquivo existente.

## 7. Gerar e executar

```powershell
npm run build
npx cap sync android
npx cap open android
```

Verifique que `dist/index.html` existe após o build. O Vite pode avisar que a saída fica fora de sua raiz web; com a configuração desta aula, ela continua dentro do projeto. Não ignore mensagens de erro.

No Android Studio, aguarde a sincronização e clique em **Run ▶**. Abrir o IDE não substitui executar a nova versão.

Depois de cada edição, repita **build → sync → Run**. `cap sync` copia os arquivos já gerados; não executa o build do Vite por você. [Fluxo oficial](https://capacitorjs.com/docs/basics/workflow)

## 8. Roteiro de verificação

| Ação | Resultado esperado |
|---|---|
| Tocar em “Simular inscrição” | Confirmação aparece. |
| Cancelar | Contador permanece igual e aparece a mensagem de cancelamento. |
| Confirmar | Contador aumenta uma unidade. |
| Fechar o diálogo | Botão volta a responder. |
| Reabrir a aplicação após encerrar sua execução | Contagem reinicia, pois não existe persistência. |

Se aparecer erro de importação, confira o script com `type="module"`, a instalação dos pacotes e o uso do endereço Vite. Se funcionar na web e falhar no Android, confira instalação do plugin, `webDir`, build, sync e nova execução.

## 9. Perguntas para discussão

1. Qual parte continua sendo HTML/CSS na WebView?
2. Qual linha chama o plugin?
3. Por que precisamos de build nesta etapa?
4. Por que cancelar não deve incrementar o contador?
5. Por que o sucesso no navegador não comprova o funcionamento no Android?

**Próxima investigação:** escolher câmera ou localização, ler a documentação oficial do plugin e identificar permissões, diferenças por plataforma e comportamento quando o usuário recusa acesso. Essa investigação não é necessária para concluir a prática deste encontro.
