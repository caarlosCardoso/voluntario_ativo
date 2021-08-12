import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voluntario_ativo/services/auth_service.dart';

class LoginProjeto extends StatefulWidget {
  const LoginProjeto({Key? key}) : super(key: key);

  @override
  _LoginProjetoState createState() => _LoginProjetoState();
}

class _LoginProjetoState extends State<LoginProjeto> {
  final _form = GlobalKey<FormState>();
  final _usuario = TextEditingController();
  final _senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = "Bem vindo";
        actionButton = "Login";
        toggleButton = "Cadastre seu projeto aqui ";
      } else {
        titulo = "Crie sua conta";
        actionButton = "Cadastrar";
        toggleButton = "Voltar ao Login ";
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(_usuario.text, _senha.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Realizado !'),
        ),
      );
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(_usuario.text, _senha.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email Cadastrado com Sucesso !'),
        ),
      );
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

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
        exit(0);
      },
    );

    //configura o AlertDialog
    AlertDialog alertSair = AlertDialog(
      title: Text("Atenção:"),
      content: Text("Deseja sair do programa ?"),
      actions: <Widget>[
        naoButton,
        sairButton,
      ],
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Acessar Informações',
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
        padding: EdgeInsets.only(
          top: 30,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 110,
            ),
            SizedBox(
              width: 100,
              height: 60,
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 35,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              height: 30,
            ),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usuario,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      border: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O  EMAIL está incorreto';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _senha,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'A SENHA está incorreta';
                      } else if (value.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      }
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_form.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            registrar();
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                            ? [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                                )
                              ]
                            : [
                                Icon(Icons.check),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    actionButton,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[300]),
                      onPressed: () => setFormAction(!isLogin),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            toggleButton,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                          ),
                          Icon(
                            Icons.account_balance_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
