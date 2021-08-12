import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:voluntario_ativo/repositories/comentariosRepository.dart';
//import 'package:voluntario_ativo/widgets/comentarios_card.dart';

class ExibirComentariosPage extends StatefulWidget {
  const ExibirComentariosPage({Key? key}) : super(key: key);

  @override
  _ExibirComentariosPageState createState() => _ExibirComentariosPageState();
}

class _ExibirComentariosPageState extends State<ExibirComentariosPage> {
  // late ComentariosRepository comentarios;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Cometários',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: null,
            icon: Image.asset('imagens/vol_simples.png'),
          ),
        ],
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.0),
        /*child: Consumer<ComentariosRepository>(
          builder: (context, comentarios, child) {
            return comentarios.lista.isEmpty
                ? ListTile(
                    leading: Icon(Icons.close),
                    title: Text('Ainda não há projetos cadastrados'),
                  )
                : ListView.builder(
                    itemCount: comentarios.lista.length,
                    itemBuilder: (_, index) {
                      return ComentariosCard(
                        comentario: comentarios.lista[index],
                      );
                    },
                  );
          },
        ),*/
      ),

      /* ListView.separated(
        itemBuilder: (BuildContext context, int comentario) {
          return ListTile(
            leading: Image.asset('imagens/vol_comentarioIcone.png'),
            title: Text(_listaComentarios[comentario].emailUsuario),
            subtitle: Text(_listaComentarios[comentario].descricaoComentario),
            trailing: Text(_listaComentarios[comentario].dataComentario),
          );
        },
        padding: EdgeInsets.all(4),
        separatorBuilder: (_, __) => Divider(),
        itemCount: _listaComentarios.length,
      ),*/
    );
  }
}
