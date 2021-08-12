import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:voluntario_ativo/databases/db_firestore.dart';
import 'package:voluntario_ativo/models/projeto.dart';
import 'package:voluntario_ativo/services/auth_service.dart';

class ProjetosRepository extends ChangeNotifier {
  List<Projeto> _listaProjetos = [];
  late FirebaseFirestore db;
  late AuthService auth;
  late String nomeProjeto;
  late String nomeCoordenador;
  late String descricaoProjeto;
  late String telefone;
  late String email;
  late String razaoSocial;
  late String estado;
  late String cidade;

  ProjetosRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _starFirestore();
    await _readProjetos();
    //await _getProjeto();
  }

  _readProjetos() async {
    if (_listaProjetos.isEmpty) {
      final snapshot =
          await db.collection('projetos/${auth.usuario!.uid}').get();
      snapshot.docs.forEach((doc) {
        nomeProjeto = doc.get('nomeProjeto');
        nomeCoordenador = doc.get('nomeCoordenador');
        descricaoProjeto = doc.get('descricaoProjeto');
        telefone = doc.get('telefone');
        email = doc.get('email');
        razaoSocial = doc.get('razaoSocial');
        estado = doc.get('estado');
        cidade = doc.get('cidade');
        Projeto projetoLeitura = new Projeto(
            nomeProjeto: nomeProjeto,
            nomeCoordenador: nomeCoordenador,
            descricaoProjeto: descricaoProjeto,
            telefone: telefone,
            email: email,
            razaoSocial: razaoSocial,
            estado: estado,
            cidade: cidade);
        _listaProjetos.add(projetoLeitura);
        notifyListeners();
      });
    }
  }

  /*
  _getProjeto() async {
    if (auth.usuario != null) {
      final snapshot =
          await db.collection('projetos/${auth.usuario!.uid}').get();
      snapshot.docs.forEach((doc) {
        projetoUnico = doc.get('nomeProjeto');
        notifyListeners();
      });
    }
  }*/

  _starFirestore() {
    db = DBFirestore.get();
  }

  UnmodifiableListView<Projeto> get lista =>
      UnmodifiableListView(_listaProjetos);

  saveProjeto(Projeto projeto) async {
    if (!_listaProjetos.contains(projeto)) {
      _listaProjetos.add(projeto);
      await db.collection('projetos/${auth.usuario!.uid}').add({
        'nomeProjeto': projeto.nomeProjeto,
        'razaoSocial': projeto.razaoSocial,
        'nomeCoordenador': projeto.nomeCoordenador,
        'email': projeto.email,
        'telefone': projeto.telefone,
        'cidade': projeto.cidade,
        'estado': projeto.estado,
        'descricaoProjetoS': projeto.descricaoProjeto,
      });

      notifyListeners();
    }
  }
}
