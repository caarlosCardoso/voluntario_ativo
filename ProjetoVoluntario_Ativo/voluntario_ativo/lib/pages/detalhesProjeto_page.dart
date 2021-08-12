import 'package:flutter/material.dart';
import 'package:voluntario_ativo/models/projeto.dart';

class DetalhesProjetosPage extends StatefulWidget {
  Projeto projeto;

  DetalhesProjetosPage({Key? key, required this.projeto}) : super(key: key);

  @override
  _DetalhesProjetosPageState createState() => _DetalhesProjetosPageState();
}

class _DetalhesProjetosPageState extends State<DetalhesProjetosPage> {
  final _form = GlobalKey<FormState>();
  final _emailComentario = TextEditingController();
  final _descricaoComentario = TextEditingController();

  enviarComentario() {
    if (_form.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Comentário enviado com sucesso'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Falha ao enviar comentário !'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.projeto.nomeProjeto.toUpperCase(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.yellowAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('imagens/vol_simples.png'),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 3,
          left: 7,
          right: 7,
        ),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Divider(),
            Container(
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Razão Social: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.projeto.razaoSocial,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nome Coordenador: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.projeto.nomeCoordenador,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Localidade: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.projeto.cidade,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(' - '),
                      Text(
                        widget.projeto.estado,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.projeto.email,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Telefone: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.projeto.telefone,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Descrição: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.projeto.descricaoProjeto,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Text(
                      'Envie um comentário ao projeto:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailComentario,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O email está em branco!';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _descricaoComentario,
                      minLines: 3,
                      maxLines: null,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.drive_file_rename_outline_outlined),
                        border: OutlineInputBorder(),
                        labelText: 'Comentário',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'O comentário está em branco';
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 24),
                      child: ElevatedButton(
                        onPressed: enviarComentario,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Enviar Comentário',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
