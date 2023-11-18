import 'package:flutter/material.dart';

class CardGerencia extends StatefulWidget {
  final String titulo;
  final String descricao;
  final double valor;
  final int qtdParticipantes;
  final double valorTotalParticipantes;

  const CardGerencia(
      {super.key,
      required this.titulo,
      required this.descricao,
      required this.valor,
      required this.qtdParticipantes,
      required this.valorTotalParticipantes});

  @override
  State<CardGerencia> createState() => _CardGerenciaState();
}

class _CardGerenciaState extends State<CardGerencia> {
  @override
  void initState() {
    super.initState();
  }

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
                    'Galinha do flutter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Divider(),
                  Text(
                    'R\$ 1.200,00 (40,00%)',
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
                          Text('12 pessoas')
                        ],
                      ),
                      Column(
                        children: [Text('Cota'), Divider(), Text('R\$ 250,00')],
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
