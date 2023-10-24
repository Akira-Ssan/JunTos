import 'package:flutter/material.dart';

class GerenciarPagamento extends StatefulWidget {
  const GerenciarPagamento({super.key});

  @override
  State<GerenciarPagamento> createState() => _GerenciarPagamentoState();
}

class _GerenciarPagamentoState extends State<GerenciarPagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir pagamento: \$Participante'),
      ),
    );
  }
}
