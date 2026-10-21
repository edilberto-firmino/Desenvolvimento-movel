import { useEffect, useRef, useState } from 'react';
import { Alert, FlatList, Keyboard, KeyboardAvoidingView, Platform, Pressable, Text, TextInput, View } from 'react-native';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';
import { prepararBanco, listarEventos, salvarEvento, excluirEvento } from './database';
import styles from './styles';

export default function App() {
  const [eventos, setEventos] = useState([]);
  const [nome, setNome] = useState('');
  const [local, setLocal] = useState('');
  const [editandoId, setEditandoId] = useState(null);
  const [pronto, setPronto] = useState(false);
  const [ocupado, setOcupado] = useState(false);
  const [mensagem, setMensagem] = useState('Abrindo banco...');
  // A trava impede dois toques de iniciar gravações simultâneas.
  const trava = useRef(false);
  const listaRef = useRef(null);

  async function iniciar() {
    if (trava.current) return;
    trava.current = true;
    setOcupado(true);
    setPronto(false);
    try {
      await prepararBanco();
      setEventos(await listarEventos());
      setPronto(true);
      setMensagem('Banco pronto. Cadastre seu primeiro evento ou consulte a lista.');
    } catch (erro) {
      console.error(erro);
      setMensagem('Não foi possível abrir o banco. Confira o terminal e tente novamente.');
    } finally {
      trava.current = false;
      setOcupado(false);
    }
  }

  useEffect(() => { iniciar(); }, []);

  function limparFormulario() {
    setEditandoId(null);
    setNome('');
    setLocal('');
  }

  async function salvar() {
    if (trava.current || !pronto) return;
    if (!nome.trim() || !local.trim()) {
      Alert.alert('Campos obrigatórios', 'Preencha nome e local do evento.');
      return;
    }
    trava.current = true;
    setOcupado(true);
    let gravou = false;
    try {
      await salvarEvento(editandoId, nome.trim(), local.trim());
      gravou = true;
      limparFormulario();
      Keyboard.dismiss();
      setEventos(await listarEventos());
      setMensagem('Evento salvo no SQLite.');
    } catch (erro) {
      console.error(erro);
      setMensagem(gravou
        ? 'Gravado, mas a lista não atualizou. Use Atualizar lista antes de cadastrar novamente.'
        : 'Não foi possível salvar. Confira o terminal e tente novamente.');
    } finally {
      trava.current = false;
      setOcupado(false);
    }
  }

  function editar(evento) {
    if (trava.current) return;
    setEditandoId(evento.id);
    setNome(evento.nome);
    setLocal(evento.local);
    setMensagem(`Editando evento #${evento.id}. Altere os campos e salve.`);
    listaRef.current?.scrollToOffset({ offset: 0, animated: true });
  }

  async function remover(id) {
    if (trava.current || !pronto) return;
    trava.current = true;
    setOcupado(true);
    let removeu = false;
    try {
      await excluirEvento(id);
      removeu = true;
      if (editandoId === id) limparFormulario();
      setEventos(await listarEventos());
      setMensagem('Evento excluído.');
    } catch (erro) {
      console.error(erro);
      setMensagem(removeu
        ? 'Excluído, mas a lista não atualizou. Use Atualizar lista.'
        : 'Não foi possível excluir. Confira o terminal.');
    } finally {
      trava.current = false;
      setOcupado(false);
    }
  }

  function confirmarExclusao(evento) {
    if (trava.current) return;
    Alert.alert('Excluir evento?', evento.nome, [
      { text: 'Cancelar', style: 'cancel' },
      { text: 'Excluir', style: 'destructive', onPress: () => remover(evento.id) },
    ]);
  }

  async function atualizar() {
    if (trava.current || !pronto) return;
    trava.current = true;
    setOcupado(true);
    try {
      setEventos(await listarEventos());
      setMensagem('Lista consultada novamente no banco.');
    } catch (erro) {
      console.error(erro);
      setMensagem('Falha ao consultar. Confira o terminal.');
    } finally {
      trava.current = false;
      setOcupado(false);
    }
  }

  const bloqueado = ocupado || !pronto;
  return (
    <SafeAreaProvider>
      <SafeAreaView style={styles.tela}>
        <KeyboardAvoidingView style={styles.tela} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
          <FlatList
            ref={listaRef}
            data={eventos}
            keyExtractor={(item) => String(item.id)}
            contentContainerStyle={styles.conteudo}
            keyboardShouldPersistTaps="handled"
            ListHeaderComponent={
              <View>
                <Text style={styles.selo}>AULA PRÁTICA 3 · SQLITE</Text>
                <Text style={styles.titulo}>Agenda do campus</Text>
                <Text style={styles.texto}>Eventos salvos neste aparelho.</Text>
                <Text accessibilityLiveRegion="polite" style={styles.mensagem}>{mensagem}</Text>
                {!pronto && !ocupado && <Pressable accessibilityRole="button" style={styles.botao} onPress={iniciar}><Text style={styles.botaoTexto}>Tentar abrir banco</Text></Pressable>}
                <View style={styles.cartao}>
                  <Text style={styles.subtitulo}>{editandoId === null ? 'Novo evento' : `Editar evento #${editandoId}`}</Text>
                  <Text style={styles.rotulo}>Nome do evento</Text>
                  <TextInput accessibilityLabel="Nome do evento" style={styles.input} value={nome} onChangeText={setNome} editable={!bloqueado} maxLength={100} placeholder="Ex.: Oficina de aplicativos" />
                  <Text style={styles.rotulo}>Local</Text>
                  <TextInput accessibilityLabel="Local do evento" style={styles.input} value={local} onChangeText={setLocal} editable={!bloqueado} maxLength={100} placeholder="Ex.: Laboratório 2" />
                  <Pressable accessibilityRole="button" accessibilityState={{ disabled: bloqueado }} disabled={bloqueado} onPress={salvar} style={[styles.botao, bloqueado && styles.desabilitado]}>
                    <Text style={styles.botaoTexto}>{ocupado ? 'Aguarde...' : editandoId === null ? 'Salvar evento' : 'Salvar alterações'}</Text>
                  </Pressable>
                  {editandoId !== null && <Pressable accessibilityRole="button" disabled={bloqueado} onPress={limparFormulario} style={styles.secundario}><Text style={styles.link}>Cancelar edição</Text></Pressable>}
                </View>
                <Text style={styles.subtitulo}>Eventos cadastrados ({eventos.length})</Text>
                <Pressable accessibilityRole="button" disabled={bloqueado} onPress={atualizar} style={styles.secundario}><Text style={styles.link}>Atualizar lista</Text></Pressable>
              </View>
            }
            ListEmptyComponent={<Text style={styles.texto}>{pronto ? 'Nenhum evento cadastrado.' : 'Aguardando o banco.'}</Text>}
            renderItem={({ item }) => (
              <View style={styles.cartao}>
                <Text style={styles.selo}>EVENTO #{item.id}</Text>
                <Text style={styles.subtitulo}>{item.nome}</Text>
                <Text style={styles.texto}>Local: {item.local}</Text>
                <View style={styles.acoes}>
                  <Pressable accessibilityRole="button" accessibilityLabel={`Editar ${item.nome}`} disabled={bloqueado} style={styles.secundario} onPress={() => editar(item)}><Text style={styles.link}>Editar</Text></Pressable>
                  <Pressable accessibilityRole="button" accessibilityLabel={`Excluir ${item.nome}`} disabled={bloqueado} style={styles.secundario} onPress={() => confirmarExclusao(item)}><Text style={styles.excluir}>Excluir</Text></Pressable>
                </View>
              </View>
            )}
            ListFooterComponent={<Text style={styles.rodape}>INBEC · Sua turma / seus nomes aqui</Text>}
          />
        </KeyboardAvoidingView>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}
