import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaMenu extends StatelessWidget {
  const TelaMenu({super.key});

  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(child: Text('Vaquinha')),
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'Login');
                      },
                      icon: const Icon(Icons.exit_to_app, size: 18),
                      label: Text('Olá, ${snapshot.data.toString()}',
                          style: const TextStyle(fontSize: 18)),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ],
        ),
      ),
      body: //Padding(
          //padding: const EdgeInsets.all(10),
          //child:

          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 0,
              height: 0,
            ),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //minimumSize: const Size(60, 60),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Cadastrar vaquinha'),
                onPressed: () {
                  Navigator.pushNamed(context, 'CompraColetiva');
                },
              ),
            ),
            /*
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 60),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Cadastrar pessoas'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'Participantes');
                },
              ),
            ),
            */
            SizedBox(
              width: 280,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 60),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Gerenciar vaquinha'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'Gerenciar');
                },
              ),
            ),
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 60),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Sobre'),
                onPressed: () {
                  Navigator.pushNamed(context, 'Sobre');
                },
              ),
            ),
            /*
            SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(60, 60),
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Sair'),
                onPressed: () {
                  closeAppUsingSystemPop();
                },
              ),
            ),*/
            const SizedBox(
              width: 1,
              height: 80,
            ),
          ],
        ),
      ),
      //),
    );
  }
}
