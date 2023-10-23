// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

//
// TELA CALCULADORA
// Stateful => stf+TAB
//
class EsqueciSenhaEmail extends StatefulWidget {
  const EsqueciSenhaEmail({super.key});

  @override
  State<EsqueciSenhaEmail> createState() => _EsqueciSenhaEmailState();
 
}

class _EsqueciSenhaEmailState extends State<EsqueciSenhaEmail> {
  
 //
  //TextEditinControler
  //Objetos responsáveis pela leitura/escrita de valores
  //nos campos de texto
  var txtUserEmailRedefine = TextEditingController();


  //
  //método para exibir o resultado do cálculo
  //

/*
  void exibirAlerta(context){
    
    showDialog(
      context: context, 
      builder: (ctx) => AlertDialog(
        title: Text("ERRO!"),
        content: Text("Use apenas números!"),
        actions: [
          TextButton(onPressed: (){
             //Navigator.pushNamed(context, 'principal');
            Navigator.of(ctx).pop();
          },
          child: Container(
            color: Color.fromARGB(255, 0, 182, 88),
            padding: const EdgeInsets.all(14),
            child: Text("OK", style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255)
            ),),
          ),
          
          )
        ],
      )
      );
  }

  void exibirResultado(context, res){
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
        title: Text('Recuperar senha'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            /*
            Image.asset(
              'assets/image/login.png',
              width: 60.0,
              height: 24.0,
              fit: BoxFit.cover,
            ),
            
            */
           
           /* Icon(
              Icons.login_outlined,
              size: 160,
              color: Colors.blue,
            ),
            
            SizedBox(
              height: 20,
            ),
            */
            
            Text('Lhe enviaremos um e-mail com um link para você acessar, onde poderá redefinir a sua senha.',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent

                  ),
               ),

             SizedBox(
              height: 20,
            ),

            TextField(
              controller: txtUserEmailRedefine,
              style: TextStyle(
                fontSize: 22,
              ),
              decoration: InputDecoration(
                labelText: 'Entre com seu email',
                hintText: 'seu.email@email.com',
                border: OutlineInputBorder(),
              ),
            ),
      
            SizedBox(
              height: 20,
            ),
            /*
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
            //
            //operações
            //

            SizedBox(
              height: 30,
            ),
          */
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
                  child: Text('Enviar'),
                  onPressed: (){
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'Login');
                    setState(() {
                      /*
                      double? v1 = double.tryParse(txtEmail.text);
                      double? v2 = double.tryParse(txtPassword.text);
                      
                      if(v1 != null && v2 != null)
                      {
                      double res = v1 + v2;
                      String resTxt = "Resultado: ";
                      exibirResultado(context, resTxt + res.toStringAsFixed(2));
                      }
                      else
                      {
                        exibirAlerta(context);
                      }
                      */ 
                      }
                      
                    );
                  },           
                ),
              
           
              ],
            ),

           
            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Cadastre-se',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue

                  ),
               ),
            
              Text('Esqueci a senha',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue

                  ),
              ),
              ],
            ),
          */
          ],
        ),
      ),
    );
  }
}
