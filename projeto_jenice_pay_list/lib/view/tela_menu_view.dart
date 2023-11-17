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

      //
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xff0A6D92)),
              accountName: Text("User name"),
              accountEmail: Text("user@e-mail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.account_circle_sharp,
                  color: Color.fromARGB(255, 90, 106, 111),
                  size: 70.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                /*   Text(
                  "RL",
                  style: TextStyle(fontSize: 40),
                ),
             */
              ),
            ),
            /*
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            
            */

            ListTile(
              title: const Text('Sobre'),
              //selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                //_onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sair'),
              //selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                //_onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            /*ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            */
          ],
        ),
      ),
      //

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
