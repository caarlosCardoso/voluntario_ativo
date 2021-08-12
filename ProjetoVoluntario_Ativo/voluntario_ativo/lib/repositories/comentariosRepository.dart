import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:voluntario_ativo/databases/db_firestore.dart';
import 'package:voluntario_ativo/models/comentario.dart';
import 'package:voluntario_ativo/services/auth_service.dart';

class ComentariosRepository extends ChangeNotifier {
  List<Comentario> _listaComentarios = [];
  late FirebaseFirestore db;
  late AuthService auth;
  late String emailUsuario;
  late String descricaoComentario;
  late String nomeProjeto;

  ComentariosRepository({required this.auth}) {
    _startRepository();
  }
  _starFirestore() {
    db = DBFirestore.get();
  }

  _startRepository() async {
    await _starFirestore();
    await _readComentarios();
  }

  _readComentarios() async {
    if (auth.usuario != null && _listaComentarios.isEmpty) {
      final snapshot = await db
          .collection('projetos/${auth.usuario!.uid}/comentarios')
          .get();
      snapshot.docs.forEach((doc) {
        nomeProjeto = doc.get('nomeProjeto');
        descricaoComentario = doc.get('descricaoComentario');
        emailUsuario = doc.get('emailUsuario');
        Comentario comentarioLeitura = Comentario(
            emailUsuario: emailUsuario,
            descricaoComentario: descricaoComentario,
            nomeProjeto: nomeProjeto);
        _listaComentarios.add(comentarioLeitura);
        notifyListeners();
      });
    }
  }

  UnmodifiableListView<Comentario> get lista =>
      UnmodifiableListView(_listaComentarios);

  saveComentario(Comentario comentario) async {
    if (!_listaComentarios.contains(comentario)) {
      _listaComentarios.add(comentario);
      await db.collection('projetos/${auth.usuario!.uid}/comentarios').add({
        'emailUsuario': comentario.emailUsuario,
        'nomeProjeto': comentario.nomeProjeto,
        'descricaoComentario': comentario.descricaoComentario,
      });

      notifyListeners();
    }
  }

  remove(Comentario comentario) async {
    await db
        .collection('projetos/${auth.usuario!.uid}/comentarios')
        .doc(comentario.descricaoComentario)
        .delete();
    _listaComentarios.remove(comentario);
    notifyListeners();
  }
}
