import 'package:flutter/material.dart';

class AlterarLoginPage extends StatefulWidget {
  const AlterarLoginPage({Key? key}) : super(key: key);

  @override
  _AlterarLoginPageState createState() => _AlterarLoginPageState();
}

class _AlterarLoginPageState extends State<AlterarLoginPage> {
  //
  final _form = GlobalKey<FormState>();
  final _usuario = TextEditingController();
  final _senha = TextEditingController();
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

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Alterar Login',
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
          child: columnDinamica(),
        ),
      ),
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
                'Atualizar Login',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Atualizar Login',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      );
    }
  }

  columnDinamica() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFormField(
          enabled: _enabled,
          controller: _usuario,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle_rounded),
            border: OutlineInputBorder(),
            labelText: 'Usuário',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'O campo USUARIO está em branco';
            }
          },
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          enabled: _enabled,
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
              return 'O campo Senha está em branco';
            }
          },
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(top: 24),
          child: buttonDinamico(),
        ),
      ],
    );
  }
}
