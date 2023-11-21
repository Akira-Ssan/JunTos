import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import '../model/participante_model.dart';
import '../repository/teste.dart';

class TelaMenu extends StatefulWidget {
  const TelaMenu({super.key});

  @override
  State<TelaMenu> createState() => _TelaMenuState();
}

class _TelaMenuState extends State<TelaMenu> {
  var vacosa = ListaVaquis();

  @override
  void initState() {
    vacosa.addv(vaquis);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
    var nomeof = FutureBuilder<String>(
                future: LoginController().usuarioLogado(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.amber),
                    );
                  }
                  return const Text('');
                },
              );
      */

    return Scaffold(
      appBar: AppBar(title: const Text('Juntos app de vaquinha')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff0A6D92)),
              accountName: FutureBuilder<String>(
                future: LoginController().usuarioLogado(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.amber),
                    );
                  }
                  return const Text('');
                },
              ),
              accountEmail: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber),
              ),
              currentAccountPicture: const CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fatec',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Ribeirão Preto',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Sobre'),
              //selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pushNamed(context, 'Sobre');
              },
            ),
            ListTile(
              title: const Text('Sair'),
              //selected: _selectedIndex == 1,
              onTap: () {
                LoginController().logout();
                Navigator.pushReplacementNamed(context, 'Login');
              },
            ),
          ],
        ),
      ),
      //

      body: ListView.builder(
        itemCount: vacosa.listaVaquinhas.length,
        itemBuilder: (context, index) {
          String id = vacosa.listaVaquinhas[index].uid;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(181, 197, 193, 231),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    padding: const EdgeInsets.all(5),
                    child: Text(vacosa.listaVaquinhas[index].titulo,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    vacosa.listaVaquinhas[index].descricao,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.monetization_on_outlined,
                              color: Colors.green, size: 24),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            vacosa.listaVaquinhas[index].valor
                                .toStringAsFixed(2),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const Icon(Icons.person_2_outlined,
                              color: Colors.amber, size: 24),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            vacosa.listaVaquinhas[index]
                                .quantidadeDeParticipantes()
                                .toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.blue, size: 24),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            vacosa.listaVaquinhas[index]
                                .totalValorDadoPorParticipantes()
                                .toStringAsFixed(2),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const Icon(Icons.percent_outlined,
                              color: Colors.red, size: 24),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            (vacosa.listaVaquinhas[index]
                                        .totalValorDadoPorParticipantes() /
                                    vacosa.listaVaquinhas[index].valor *
                                    100)
                                .toStringAsFixed(2),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            size: 32, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            vacosa.listaVaquinhas.removeAt(index);
                          });
                        },
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        icon: const Icon(Icons.edit_document,
                            size: 32, color: Colors.brown),
                        onPressed: () {
                          //passando dados da vaquinha selecionada
                          Vaquinha v = vacosa.listaVaquinhas[index];
                          //abrindo a tela que edita os documentos
                          //fonte: APP04 listview do professor
                          Navigator.pushNamed(context, 'CriarVaquinha',
                              arguments: v);
                        },
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        icon: const Icon(Icons.attach_money,
                            size: 32, color: Colors.blueAccent),
                        onPressed: () {
                          //passando dados da vaquinha selecionada
                          Vaquinha v = vacosa.listaVaquinhas[index];
                          //abrindo a tela que gerencia a vaquinha
                          //fonte APP04
                          Navigator.pushNamed(context, 'Gerenciar',
                              arguments: v);
                        },
                      ),
                    ],
                  ),
                ),
                /*ListTile(
                  leading: const Icon(
                    Icons.edit_document,
                    size: 48,
                    color: Colors.amber,
                  ),
                  title: Text(
                      'Valor: R\$ ${(vacosa.listaVaquinhas[index].valor).toStringAsFixed(2)}'),
                  subtitle: Text(
                      'Participantes: ${vacosa.listaVaquinhas[index].quantidadeDeParticipantes()}\nValor arrecado: R\$ ${(vacosa.listaVaquinhas[index].totalValorDadoPorParticipantes()).toStringAsFixed(2)}'),
                  trailing:
                      Icon(Icons.arrow_forward, color: Colors.amber, size: 48),
                )*/
              ]),
            ),
          );
        },
        padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
      ), //Padding(
      //padding: const EdgeInsets.all(10),
      //child:

      //),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'CriarVaquinha');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
