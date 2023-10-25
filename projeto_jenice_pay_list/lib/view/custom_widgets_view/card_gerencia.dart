import 'package:flutter/material.dart';

class CardGerencia extends StatefulWidget {
  const CardGerencia({super.key});

  @override
  State<CardGerencia> createState() => _CardGerenciaState();
}

class _CardGerenciaState extends State<CardGerencia> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(1.0),
          child: Center(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Text(
                    'A galinha do flutter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Divider(),
                  Text(
                    'R\$ 2.500,00 (83,33%)',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                      //color: Colors.amber,
                      //endIndent: 80,
                      //indent: 80,
                      //height: 10,
                      //thickness: 3,
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          Text('Meta'),
                          Divider(
                            color: Colors.blue,
                            thickness: 5,
                          ),
                          Text('R\$ 3.000,00')
                        ],
                      ),
                      Column(
                        children: [
                          Text('Participantes'),
                          Divider(),
                          Text('30 pessoas')
                        ],
                      ),
                      Column(
                        children: [Text('Cota'), Divider(), Text('R\$ 100,00')],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*
Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(width: 5),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 5),
                    ),
                    child: const Text(
                      '99%',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                */
