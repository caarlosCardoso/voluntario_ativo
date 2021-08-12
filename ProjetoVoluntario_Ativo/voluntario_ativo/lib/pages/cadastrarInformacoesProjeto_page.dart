import "package:flutter/material.dart";
import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
//import 'package:voluntario_ativo/models/projeto.dart';
import 'package:voluntario_ativo/pages/editarProjeto_page.dart';
import 'package:voluntario_ativo/pages/home_page.dart';
//import 'package:voluntario_ativo/repositories/projetosRepository.dart';

class CadastrarInformacoesProjetoPage extends StatefulWidget {
  const CadastrarInformacoesProjetoPage({Key? key}) : super(key: key);

  @override
  _CadastrarInformacoesProjetoPageState createState() =>
      _CadastrarInformacoesProjetoPageState();
}

class _CadastrarInformacoesProjetoPageState
    extends State<CadastrarInformacoesProjetoPage> {
  var _estados = [
    '',
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PR',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO'
  ];
  var _estadosItemSelecionado = "";
  //
  final _form = GlobalKey<FormState>();
  final _nomeProjeto = TextEditingController();
  final _nomeCoordenador = TextEditingController();
  final _descricao = TextEditingController();
  final _telefone = TextEditingController();
  final _email = TextEditingController();
  final _razaoSocial = TextEditingController();
  final _cidade = TextEditingController();
  // late ProjetosRepository projetos;

  finalizarCadastro() {
    if (_form.currentState!.validate()) {
      /* projetos.saveAll(
        Projeto(
          nomeProjeto: _nomeProjeto.value.toString(),
          nomeCoordenador: _nomeCoordenador.value.toString(),
          descricaoProjeto: _descricao.value.toString(),
          telefone: _telefone.value.toString(),
          email: _email.value.toString(),
          razaoSocial: _razaoSocial.value.toString(),
          estado: _estadosItemSelecionado.toString(),
          cidade: _cidade.value.toString(),
        ),
      );*/
      EditarProjetoPage();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro Realizado !'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Falha, verifique os campos !'),
        ),
      );
    }
  }

  voltarHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // projetos = Provider.of<ProjetosRepository>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Cadastrando Informações',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('imagens/vol_simples.png'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomeProjeto,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_balance_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Nome do Projeto Social',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _razaoSocial,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_library_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Razão Social',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _nomeCoordenador,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.people_alt_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Nome do Coordenador(a)',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _email,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Email de Contato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _telefone,
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  labelText: 'Telefone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                ),
                child: Row(
                  children: [
                    Text('  '),
                    Icon(
                      Icons.location_on_rounded,
                      color: Colors.black45,
                    ),
                    Text(
                      '  Estado:   ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ),
                    DropdownButton<String>(
                      dropdownColor: Colors.white,
                      items: _estados.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (novoEstadoSelecionado) {
                        setState(() {
                          this._estadosItemSelecionado = novoEstadoSelecionado!;
                        });
                      },
                      value: _estadosItemSelecionado,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _cidade,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on_rounded),
                  border: OutlineInputBorder(),
                  labelText: 'Cidade',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descricao,
                minLines: 6,
                maxLines: null,
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.drive_file_rename_outline_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Descrição do Projeto',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O campo está em branco';
                  }
                },
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: finalizarCadastro,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Finalizar Cadastro',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
