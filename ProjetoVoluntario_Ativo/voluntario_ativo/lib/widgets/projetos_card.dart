import 'package:flutter/material.dart';
import 'package:voluntario_ativo/models/projeto.dart';
import 'package:voluntario_ativo/pages/detalhesProjeto_page.dart';

class ProjetosCard extends StatefulWidget {
  Projeto projeto;

  ProjetosCard({Key? key, required this.projeto}) : super(key: key);

  @override
  _ProjetosCardState createState() => _ProjetosCardState();
}

class _ProjetosCardState extends State<ProjetosCard> {
  abrirDetalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetalhesProjetosPage(projeto: widget.projeto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () => abrirDetalhes,
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
                child: Text(
                  widget.projeto.estado,
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.projeto.nomeProjeto.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Razão Social:' + widget.projeto.razaoSocial,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        'Coordenador:' + widget.projeto.nomeCoordenador,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        'Email:' + widget.projeto.email,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        'Telefone:' + widget.projeto.telefone,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        'Cidade:' + widget.projeto.cidade,
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      Text(
                        'Descricao:' + widget.projeto.descricaoProjeto,
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
