import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voluntario_ativo/pages/exibirComentarios_page.dart';
import 'package:voluntario_ativo/pages/exibirInformacoes_page.dart';
import 'package:voluntario_ativo/services/auth_service.dart';

class EditarProjetoPage extends StatefulWidget {
  const EditarProjetoPage({Key? key}) : super(key: key);

  @override
  _EditarProjetoPageState createState() => _EditarProjetoPageState();
}

class _EditarProjetoPageState extends State<EditarProjetoPage> {
  @override
  Widget build(BuildContext context) {
    Widget naoButton = new TextButton(
      child: Text("NÃO"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget sairButton = new TextButton(
      child: Text("SIM"),
      onPressed: () {
        Navigator.pop(context);
        context.read<AuthService>().logout();
      },
    );

    //configura o AlertDialog
    AlertDialog alertSair = AlertDialog(
      title: Text("Atenção:"),
      content: Text("Deseja sair da conta ?"),
      actions: <Widget>[
        naoButton,
        sairButton,
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Menu de Opções',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
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
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Container(
          color: Colors.grey[100],
          // padding: EdgeInsets.all(30.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Card(
                margin: EdgeInsets.all(40.0),
                color: Colors.black87,
                child: InkWell(
                  onTap: () {
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AlterarLoginPage(),
                      ),
                    );*/
                  },
                  splashColor: Colors.yellowAccent[300],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.photo_album_outlined,
                          size: 70.0,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Gerenciar Fotos',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(40.0),
                color: Colors.black87,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExibirInformacoesPage(),
                      ),
                    );
                  },
                  splashColor: Colors.yellowAccent[300],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.list_alt_outlined,
                          size: 70.0,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Informações do Projeto',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(40.0),
                color: Colors.black87,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExibirComentariosPage(),
                      ),
                    );
                  },
                  splashColor: Colors.yellowAccent[300],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.insert_comment_outlined,
                          size: 70.0,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Exibir Comentários',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
