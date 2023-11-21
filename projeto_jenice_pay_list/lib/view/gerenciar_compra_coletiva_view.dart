import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/model/participante_model.dart';
import '../repository/teste.dart';

//import 'package:projeto_jenice_pay_list/view/custom_widgets_view/user_card2.dart';

class GerenciarView extends StatefulWidget {
  const GerenciarView({super.key});

  @override
  State<GerenciarView> createState() => _GerenciarViewState();
}

class _GerenciarViewState extends State<GerenciarView> {
  var txtValorDado = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    //Recuperando os dados da vaquinha enviado
    //
    var vaquinha = ModalRoute.of(context)!.settings.arguments as Vaquinha;
    //
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
          Center(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  /*Container(
                    alignment: const Alignment(0, 0),
                    width: 380,
                    height: 36,
                    color: Colors.teal[200],
                    child: Text(
                      vaquinha.titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  )*/

                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 128, 203, 196),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      padding: const EdgeInsets.all(5),
                      child: Text(vaquinha.titulo,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  //const Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Text(
                      'R\$ ${vaquinha.totalValorDadoPorParticipantes().toStringAsFixed(2)} '
                      '(${(vaquinha.totalValorDadoPorParticipantes() / vaquinha.valor * 100).toStringAsFixed(2)}%)',
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                      //color: Colors.amber,
                      //endIndent: 80,
                      //indent: 80,
                      //height: 10,
                      //thickness: 3,
                      ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            const Text('Meta'),
                            const Divider(),
                            Text('R\$ ${vaquinha.valor.toStringAsFixed(2)}')
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Restam'),
                            const Divider(),
                            Text(
                                'R\$ ${(vaquinha.valor - vaquinha.totalValorDadoPorParticipantes()).toStringAsFixed(2)}')
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Participantes'),
                            const Divider(),
                            Text(
                                vaquinha.quantidadeDeParticipantes().toString())
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Cota por pessoa'),
                            const Divider(),
                            Text(
                                'R\$ ${(vaquinha.valor / vaquinha.quantidadeDeParticipantes()).toStringAsFixed(2)}')
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Recebendo pagamento de ${vaquinha.listaParticipantes.participantes[index].nome}'),
                                content: SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Digite o valor",
                                      ),
                                      const SizedBox(height: 25),
                                      TextField(
                                        controller: txtValorDado,
                                        decoration: const InputDecoration(
                                          labelText: 'valor',
                                          prefixIcon:
                                              Icon(Icons.monetization_on),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actionsPadding: const EdgeInsets.all(20),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Voltar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (txtValorDado.text.isEmpty) {
                                        Navigator.pop(context);
                                      } else {
                                        Navigator.pop(
                                            context, txtValorDado.text);
                                      }
                                    },
                                    child: const Text('Salvar'),
                                  ),
                                ],
                              );
                            },
                          ).then((valor) {
                            setState(() {
                              vaquinha.listaParticipantes.participantes[index]
                                  .valorDado += double.parse(valor);
                              txtValorDado.clear();
                              vaquinha.totalValorDadoPorParticipantes();
                            });
                          });
                        }),
                    //tabela[index].nome

                    title: Text(
                        '${index + 1}. ${vaquinha.listaParticipantes.participantes[index].nome}'),
                    // ignore: prefer_const_constructors
                    trailing: Text(
                        'R\$ ${vaquinha.listaParticipantes.participantes[index].valorDado.toStringAsFixed(2)}'),
                  );
                },
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: vaquinha.listaParticipantes.participantes.length),
          ),
        ]),
      ),
    );
  }
}
