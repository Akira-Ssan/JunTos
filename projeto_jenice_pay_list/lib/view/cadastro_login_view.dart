// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class CadastroLoginView extends StatefulWidget {
  const CadastroLoginView({super.key});

  @override
  State<CadastroLoginView> createState() => _CadastroLoginViewState();
 
}

class _CadastroLoginViewState extends State<CadastroLoginView> {
  
 //
  //TextEditinControler
  //Objetos responsáveis pela leitura/escrita de valores
  //nos campos de texto
  var txtName = TextEditingController();
  var txtUserEmail = TextEditingController();
  var txtPass = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar usuário'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
          
            
            TextField(
              controller: txtName,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Entre com seu nome',
                border: OutlineInputBorder(),
              ),
            ),
      
            SizedBox(
              height: 20,
            ),
      
            TextField(
              controller: txtUserEmail,
              style: TextStyle(
              fontSize: 22,
            ),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Entre com seu E-mail',
                
                border: OutlineInputBorder(),
              ),
            ),
            
            SizedBox(
              height: 30,
            ),
            
            TextField(
              controller: txtPass,
              obscureText: true,
              style: TextStyle(
              fontSize: 22,
            ),
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Entre com sua senha',
                
                border: OutlineInputBorder(),
              ),
            ),
          

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               //botão cadastrar
                OutlinedButton( 
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    textStyle: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: Text('Cadastrar'),
                  onPressed: (){
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'Login');
                    setState(() {
                     
                      }
                      
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
