import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/card_gerencia.dart';

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
      body: const CardGerencia(),
    );
  }
}
