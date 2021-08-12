import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voluntario_ativo/models/projeto.dart';
import 'package:voluntario_ativo/pages/detalhesProjeto_page.dart';
import 'package:voluntario_ativo/repositories/projetosRepository.dart';
import 'package:voluntario_ativo/widgets/projetos_card.dart';

class ProjetosPage extends StatefulWidget {
  const ProjetosPage({Key? key}) : super(key: key);

  @override
  _ProjetosPageState createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  // late ProjetosRepository projetos;

  mostrarDetalhes(Projeto projeto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetalhesProjetosPage(projeto: projeto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    Widget naoButton = new TextButton(
      child: Text("NÃO"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget sairButton = new TextButton(
      child: Text("SIM"),
      onPressed: () {
        exit(0);
      },
    );

    //configura o AlertDialog
    AlertDialog alertSair = AlertDialog(
      title: Text("Atenção:"),
      content: Text(" Deseja sair do programa ?"),
      actions: <Widget>[
        naoButton,
        sairButton,
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Selecione um Projeto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: null,
          icon: Image.asset('imagens/vol_simples.png'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog<void>(context: context, builder: (_) => alertSair);
            },
            icon: Icon(
              Icons.cancel_outlined,
              color: Colors.yellowAccent,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.0),
        child: Consumer<ProjetosRepository>(
          builder: (context, projetos, child) {
            return projetos.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Ainda não há projetos cadastrados'),
                  )
                : ListView.builder(
                    itemCount: projetos.lista.length,
                    itemBuilder: (_, index) {
                      return ProjetosCard(
                        projeto: projetos.lista[index],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
