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
          Image.asset(
              'assets/images/logo1.png'),

          const SizedBox(
            width: double.infinity,
            height: 20,
          ),

          Text('JunTos',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
              )),
          //Text('Calculadora construída com o framework Flutter'),
          const Text('Aplicativo para vaquinha ^\'qp\'^',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              )),

          const SizedBox(
            width: double.infinity,
            height: 40,
          ),

          OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 30, 112, 244),
                foregroundColor: Colors.white,
                minimumSize: const Size(180, 60),

                // ignore: prefer_const_constructors
                textStyle: TextStyle(
                  fontSize: 20,
                )),
            onPressed: () {
              //navegar para rota
              Navigator.pushNamed(context, 'Login');
            },
            child: const Text('Entrar'),
          ),

          /*Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Pug_dog.jpg/1200px-Pug_dog.jpg',
          )
          */
        ],
      ),
    );
  }
}
