import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/repository/participantes_repo.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/card_gerencia.dart';
//import 'package:projeto_jenice_pay_list/view/custom_widgets_view/user_card2.dart';

class GerenciarView extends StatefulWidget {
  const GerenciarView({super.key});

  @override
  State<GerenciarView> createState() => _GerenciarViewState();
}

class _GerenciarViewState extends State<GerenciarView> {
  final tabela = PessoaRepo.tabela;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          //tooltip: 'Voltar ao menu',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'TelaMenu');
          },
        ),
        title: const Text('Gerenciar vaquinha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const CardGerencia(),
          SizedBox(
            height: 580,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: IconButton(
                        icon: const Icon(
                          Icons.monetization_on,
                          size: 30,
                          color: Color.fromARGB(255, 41, 153, 47),
                        ),
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, 'GerenciarInserirPagamento');
                        }),

                    title: Text('${index + 1}. ${tabela[index].nome}'),
                    // ignore: prefer_const_constructors
                    trailing: Text('R\$ 100,00'),
                  );
                },
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: tabela.length),
          ),
        ]),
      ),
    );
  }
}
