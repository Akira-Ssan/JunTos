import '../controller/tarefa_controller.dart';
import '../controller/login_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      //
      //Body
      //
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: StreamBuilder<QuerySnapshot>(
          stream: TarefaController().listar().snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                //
                //Listando as vaquinhas salvas na listview
                //
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic item = dados.docs[index].data();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(181, 197, 193, 231),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                padding: const EdgeInsets.all(5),
                                //
                                //titulo da vaquinha
                                //
                                child: Text(item['titulo'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            //
                            //descrição da vaquinha
                            //
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                item['descricao'],
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Icon(Icons.monetization_on_outlined,
                                          color: Colors.green, size: 24),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item['valor'].toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  //
                                  //Qauntidade de participantes da vaquinha
                                  //
                                  Column(
                                    children: [
                                      const Icon(Icons.person_2_outlined,
                                          color: Colors.amber, size: 24),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item['qtdParticipantes'].toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  //
                                  //Valor total dado pelos participantes da vaquinha.
                                  //
                                  Column(
                                    children: [
                                      const Icon(
                                          Icons.account_balance_wallet_outlined,
                                          color: Colors.blue,
                                          size: 24),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        item['valorTotalParticipantes']
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  //
                                  //Porcentagem em relação do valor da vaquinha e valor dado pelos participantes
                                  //
                                  Column(
                                    children: [
                                      const Icon(Icons.percent_outlined,
                                          color: Colors.red, size: 24),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        (item['valorTotalParticipantes'] /
                                                item['valor'] *
                                                100)
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                  //
                                  //Botão excluir
                                  //
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline,
                                        size: 32, color: Colors.red),
                                    onPressed: () {
                                      TarefaController().excluir(context, id);
                                      /* setState(() {
                              vacosa.listaVaquinhas.removeAt(index);
                            });*/
                                    },
                                    //
                                    //Botão editar documento
                                    //
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                    icon: const Icon(Icons.edit_document,
                                        size: 32, color: Colors.brown),
                                    onPressed: () {
                                      //passando dados da vaquinha selecionada
                                      //convertendo de JSON para objeto dart
                                      Vaquinha v = Vaquinha.fromJson(item);
                                      //abrindo a tela que edita os documentos
                                      final args = [v, id];
                                      Navigator.pushNamed(
                                          context, 'CriarVaquinha',
                                          arguments: args);
                                    },
                                    //
                                    //Botão Gerenciar vaquinha
                                    //
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                    icon: const Icon(Icons.attach_money,
                                        size: 32, color: Colors.blueAccent),
                                    onPressed: () {
                                      //passando dados da vaquinha selecionada
                                      Vaquinha v = Vaquinha.fromJson(item);
                                      //Criando lista com dados da vaquinha e id para enviar
                                      //para outra tela
                                      final args = [v, id];
                                      Navigator.pushNamed(context, 'Gerenciar',
                                          arguments: args);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      );
                    },
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                  );
                } else {
                  return const Center(child: Text('data'));
                }
            }
          },
        ),
      ), //Padding(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'CriarVaquinha');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
