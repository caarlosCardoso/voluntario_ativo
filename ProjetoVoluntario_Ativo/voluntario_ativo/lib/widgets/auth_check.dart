import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voluntario_ativo/pages/editarProjeto_page.dart';
import 'package:voluntario_ativo/pages/loginProjeto_page.dart';
import 'package:voluntario_ativo/services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading)
      return loading();
    else if (auth.usuario == null)
      return LoginProjeto();
    else
      return EditarProjetoPage();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
