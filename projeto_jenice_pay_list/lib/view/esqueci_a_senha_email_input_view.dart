// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class EsqueciSenhaEmail extends StatefulWidget {
  const EsqueciSenhaEmail({super.key});

  @override
  State<EsqueciSenhaEmail> createState() => _EsqueciSenhaEmailState();
 
}

class _EsqueciSenhaEmailState extends State<EsqueciSenhaEmail> {
  

  var txtUserEmailRedefine = TextEditingController();




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
                  child: Text('Enviar'),
                  onPressed: (){
                  
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
