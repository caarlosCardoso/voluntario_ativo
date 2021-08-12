import 'package:flutter/material.dart';
import 'package:voluntario_ativo/models/comentario.dart';

class ComentariosCard extends StatefulWidget {
  Comentario comentario;

  ComentariosCard({Key? key, required this.comentario}) : super(key: key);

  @override
  _ComentariosCardState createState() => _ComentariosCardState();
}

class _ComentariosCardState extends State<ComentariosCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: Image.asset('imagens/vol_comentarioIcone.png'),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.comentario.emailUsuario,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Comentario:' + widget.comentario.descricaoComentario,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ],
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
