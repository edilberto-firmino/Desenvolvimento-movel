import * as SQLite from 'expo-sqlite';

let conexao;

export async function abrirBanco() {
  if (!conexao) {
    conexao = SQLite.openDatabaseAsync('eventos-campus.db').catch((erro) => {
      conexao = undefined;
      throw erro;
    });
  }
  return conexao;
}

export async function prepararBanco() {
  const db = await abrirBanco();
  // Somente SQL fixo aqui. Nunca interpolar o texto do formulário.
  await db.execAsync(`
    CREATE TABLE IF NOT EXISTS eventos (
      id INTEGER PRIMARY KEY NOT NULL,
      nome TEXT NOT NULL CHECK(length(trim(nome)) > 0),
      local TEXT NOT NULL CHECK(length(trim(local)) > 0)
    );
  `);
}

export async function listarEventos() {
  const db = await abrirBanco();
  return db.getAllAsync('SELECT id, nome, local FROM eventos ORDER BY id DESC;');
}

export async function salvarEvento(id, nome, local) {
  const db = await abrirBanco();
  if (id === null) {
    return db.runAsync('INSERT INTO eventos (nome, local) VALUES (?, ?);', nome, local);
  }
  return db.runAsync('UPDATE eventos SET nome = ?, local = ? WHERE id = ?;', nome, local, id);
}

export async function excluirEvento(id) {
  const db = await abrirBanco();
  return db.runAsync('DELETE FROM eventos WHERE id = ?;', id);
}
