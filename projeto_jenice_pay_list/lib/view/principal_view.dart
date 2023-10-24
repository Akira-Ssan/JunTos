import 'package:flutter/material.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // alinhamento vertical
        mainAxisAlignment: MainAxisAlignment.center,
        //alinhamento horizontal
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(
            Icons.radio_button_checked,
            color: Colors.blueGrey,
            size: 120.0,
          ),

          SizedBox(
            width: double.infinity,
            height: 20,
          ),

          Text('Flutter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
              )),
          //Text('Calculadora construída com o framework Flutter'),
          Text('ONONONONONONONONON',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              )),

          SizedBox(
            width: double.infinity,
            height: 40,
          ),

          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              minimumSize: Size(180, 36),
            ),
            onPressed: () {
              //navegar para rota
              Navigator.pushNamed(context, 'Login');
            },
            child: Text('Entrar'),
          ),

          /*Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Pug_dog.jpg/1200px-Pug_dog.jpg',
          )
          */
        ],
      ),
    );
  }
}
