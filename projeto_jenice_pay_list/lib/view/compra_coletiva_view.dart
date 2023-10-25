import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/user_card2.dart';
//import 'package:projeto_jenice_pay_list/view/ccv_list1.dart';

class CompraColetiva extends StatefulWidget {
  const CompraColetiva({super.key});

  @override
  State<CompraColetiva> createState() => _CompraColetivaState();
}

class _CompraColetivaState extends State<CompraColetiva> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Voltar ao menu',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'TelaMenu');
          },
        ),
        title: const Text('Lista de compra coletiva'),
      ),
      body: const Column(
        children: [
          UserCard2(
            titulo: 'Galinha do Flutter',
            subtitulo:
                'Vaquinha para comprar o mascote do flutter uma galinha de pelúcia',
            valor: 3000.0,
          ),
          UserCard2(
            titulo: 'Urso Pelúcia',
            subtitulo:
                'Vaquinha para comprar um urso de pelúcia grande e macio para Jenice',
            valor: 600.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'CompraColetivaNEview');
        },
        backgroundColor: Colors.cyan,
        tooltip: 'Adicionar vaquinha',
        child: const Icon(Icons.add),
      ),
    );
  }
}
