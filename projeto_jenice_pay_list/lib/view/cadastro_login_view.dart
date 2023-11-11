// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class CadastroLoginView extends StatefulWidget {
  const CadastroLoginView({super.key});

  @override
  State<CadastroLoginView> createState() => _CadastroLoginViewState();
}

class _CadastroLoginViewState extends State<CadastroLoginView> {
  //TextEditinController
  //Objetos responsáveis pela leitura/escrita de valores
  //nos campos de texto
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Criar Conta'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            TextField(
              controller: txtNome,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Entre com seu nome',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtEmail,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Entre com seu E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: txtSenha,
              obscureText: true,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Entre com sua senha',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //
                //botão cancaelar
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    textStyle: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                //
                //botão cadastrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    textStyle: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: Text('Salvar'),
                  onPressed: () {
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtEmail.text,
                      txtSenha.text,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
