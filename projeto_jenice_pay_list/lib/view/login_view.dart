// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();



  void exibirAlerta(context) {
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
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            TextField(
              controller: txtPassword,
              obscureText: true,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite a senha',
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
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'TelaMenu');

                  
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
               
                GestureDetector(
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'Cadastro');
                  },
                ),
                GestureDetector(
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'EsqueciSenha');
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
