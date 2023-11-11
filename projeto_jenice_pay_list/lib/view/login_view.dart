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
  /*void exibirAlerta(context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text("ERRO!"),
              content: Text("Use apenas números!"),
              actions: [
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, 'principal');
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    color: Color.fromARGB(255, 0, 182, 88),
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ],
            ));
  }

  
  void exibirResultado(context, res) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(res),
        duration: Duration(seconds: 2),
      ),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
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
              ],
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
                        fontSize: 16,
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
                TextButton(
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(
                        fontSize: 16,
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
                          content: Container(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
