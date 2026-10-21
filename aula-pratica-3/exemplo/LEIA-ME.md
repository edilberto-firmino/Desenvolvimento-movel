# Agenda do campus é aula prática 3

Estes três arquivos são o código did?tico, não um projeto Expo completo.

1. Crie o projeto: `npx create-expo-app@latest agenda-campus-sqlite --template blank`.
2. Entre na pasta: `cd agenda-campus-sqlite`.
3. Instale: `npx expo install expo-sqlite react-native-safe-area-context`.
4. Copie App.js, database.js e styles.js desta pasta para a raiz do projeto criado.
5. Preserve index.js, app.json, package.json e demais arquivos gerados.
6. Inicie: `npx expo start --go` e abra em dispositivo compatível.

O manual completo está em ../index.html. Use celular ou emulador. A configuração web não faz parte desta aula.

O SQLite cria eventos-campus.db no ambiente local do aplicativo. Não crie o arquivo manualmente. Os dados não são compartilhados entre aparelhos. Teste cadastro, edição, exclusão e fechamento/reabertura do mesmo projeto no mesmo dispositivo. Não desinstale o app nem limpe os dados para realizar esse teste.
