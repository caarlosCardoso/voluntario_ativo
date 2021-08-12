import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:provider/provider.dart';
//import 'package:voluntario_ativo/models/projeto.dart';
import 'package:voluntario_ativo/pages/editarProjeto_page.dart';
//import 'package:voluntario_ativo/repositories/projetosRepository.dart';

class ExibirInformacoesPage extends StatefulWidget {
  const ExibirInformacoesPage({Key? key}) : super(key: key);

  @override
  _ExibirInformacoesPageState createState() => _ExibirInformacoesPageState();
}

class _ExibirInformacoesPageState extends State<ExibirInformacoesPage> {
  // late ProjetosRepository projetos;
  @override
  //
  var _estados = [
    '',
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Distrito Federal',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins'
  ];
  var _estadosItemSelecionado = "";
  //
  final _form = GlobalKey<FormState>();
  final _nomeProjeto = TextEditingController();
  final _nomeCoordenador = TextEditingController();
  final _descricao = TextEditingController();
  final _telefone = TextEditingController();
  final _email = TextEditingController();
  final _cidade = TextEditingController();
  final _razaoSocial = TextEditingController();
  bool _enabled = false;

  @override
  void initState() {
    // TODO: implement initState
    _enabled = false;
  }

  void setEnable() {
    setState(() {
      _enabled = true;
    });
  }

  finalizarCadastro() {
    if (_form.currentState!.validate()) {
      /*projetos.saveAll(
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

  Widget build(BuildContext context) {
    // projetos = Provider.of<ProjetosRepository>(context);

    buttonDinamico() {
      if (_enabled == false) {
        return ElevatedButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Atualizar Informações',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        );
      } else {
        return ElevatedButton(
          onPressed: finalizarCadastro,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Cadastrar Informações',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        );
      }
    }

    paddingDinamico() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                enabled: _enabled,
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
                child: buttonDinamico(),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Informações do Projeto',
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
      body: paddingDinamico(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setEnable();
        },
        label: Text('Editar'),
        icon: Icon(
          Icons.loop_outlined,
          color: Colors.yellowAccent,
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
