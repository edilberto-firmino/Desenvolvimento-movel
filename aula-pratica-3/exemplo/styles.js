import { StyleSheet } from 'react-native';

export default StyleSheet.create({
  tela: { flex: 1, backgroundColor: '#f1f5f9' },
  conteudo: { padding: 20, gap: 14, width: '100%', maxWidth: 700, alignSelf: 'center', paddingBottom: 40 },
  selo: { fontSize: 12, fontWeight: '700', color: '#155bc7', marginBottom: 8 },
  titulo: { fontSize: 30, fontWeight: '800', color: '#122542', marginBottom: 8 },
  subtitulo: { fontSize: 20, fontWeight: '700', color: '#122542', marginBottom: 10 },
  texto: { fontSize: 16, lineHeight: 24, color: '#334155' },
  mensagem: { fontSize: 15, lineHeight: 22, color: '#164e63', backgroundColor: '#e0f2fe', padding: 14, borderRadius: 10, marginVertical: 16 },
  cartao: { backgroundColor: '#fff', padding: 18, borderRadius: 14, borderWidth: 1, borderColor: '#dce4ef', marginBottom: 12 },
  rotulo: { fontSize: 16, fontWeight: '600', color: '#233047', marginBottom: 6 },
  input: { borderWidth: 1, borderColor: '#64748b', borderRadius: 8, padding: 12, color: '#122542', backgroundColor: '#fff', fontSize: 16, marginBottom: 16 },
  botao: { backgroundColor: '#1d4ed8', padding: 15, borderRadius: 8, alignItems: 'center' },
  botaoTexto: { color: '#fff', fontSize: 16, fontWeight: '700' },
  desabilitado: { opacity: 0.5 },
  secundario: { padding: 12, minHeight: 48, justifyContent: 'center' },
  link: { color: '#155bc7', fontSize: 16, fontWeight: '600' },
  excluir: { color: '#b91c1c', fontSize: 16, fontWeight: '600' },
  acoes: { flexDirection: 'row', flexWrap: 'wrap', gap: 12, marginTop: 8 },
  rodape: { color: '#475569', fontSize: 13, textAlign: 'center', marginTop: 20 },
});
