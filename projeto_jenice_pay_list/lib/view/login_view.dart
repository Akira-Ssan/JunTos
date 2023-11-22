// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import '../controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var txtEmail = TextEditingController();
  var txtPassw = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
        child: Column(
          children: [
            Icon(
              Icons.login_outlined,
              size: 160,
              color: Colors.blue,
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
                hintText: 'Entre com e-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPassw,
              obscureText: true,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite a senha',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: Text(
                  'Esqueci a senha',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Esqueceu a senha?"),
                        content: SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Text(
                                "Identifique-se para receber um e-mail com as instruções e o link para criar uma nova senha.",
                              ),
                              SizedBox(height: 25),
                              TextField(
                                controller: txtEmailEsqueceuSenha,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actionsPadding: EdgeInsets.all(20),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancelar'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              LoginController().esqueceuSenha(
                                context,
                                txtEmailEsqueceuSenha.text,
                              );
                            },
                            child: Text('Enviar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(60, 60),
                  textStyle: TextStyle(
                    fontSize: 28,
                  ),
                ),
                child: Text('Entrar'),
                onPressed: () {
                  LoginController().login(
                    context,
                    txtEmail.text,
                    txtPassw.text,
                  );
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                //Cadastrar email
                //
                TextButton(
                  child: Text(
                    'Ainda não tem conta?',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Cadastro');
                  },
                ),
                //
                // Esqueceu a senha
                //
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
//Preenche o campo email e senha
    //depois de cadastrar
    //
    var argsDaRota = ModalRoute.of(context);

    if (argsDaRota != null && argsDaRota.settings.arguments != null) {
      var argsLista = argsDaRota.settings.arguments as List;
      var email = argsLista[0] as dynamic;
      var senha = argsLista[1] as dynamic;

      txtEmail.text = email.toString();
      txtPassw.text = senha.toString();

      //
    }
    */