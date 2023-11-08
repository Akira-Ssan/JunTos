import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/repository/participantes_repo.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/alert_dialogue_fn.dart';

class CompraColetiva extends StatefulWidget {
  const CompraColetiva({super.key});

  @override
  State<CompraColetiva> createState() => _CompraColetivaState();
}

class _CompraColetivaState extends State<CompraColetiva> {
  final txtTitulo = TextEditingController();
  final txtSubtitulo = TextEditingController();
  final txtValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tabela = PessoaRepo.tabela;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          //tooltip: 'Voltar ao menu',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'TelaMenu');
          },
        ),
        title: const Text('Nova vaquinha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txtTitulo,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                labelText: 'Titulo',
                hintText: 'Entre com título da vaquinhna',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtSubtitulo,
              maxLines: 2,
              //obscureText: true,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Uma breve descrição',
                border: OutlineInputBorder(),
                //hintMaxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtValor,

              //obscureText: true,
              style: const TextStyle(
                fontSize: 16,
              ),
              decoration: const InputDecoration(
                  labelText: 'Valor',
                  hintText: 'Entre com o valor',
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                    'reais',
                    style: TextStyle(fontSize: 14),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 400,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            color: Colors.redAccent,
                            onPressed: () {
                              exibirAlerta(
                                  context,
                                  'Remover participante',
                                  'Tem certesa que deseja remover o participante?',
                                  'cancel_yes');
                            },
                          ),
                          title: Text(tabela[index].nome),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                            onPressed: () {
                              exibirAlerta(
                                  context,
                                  'Editar nome do participante',
                                  'Digite o novo nome:',
                                  'input_ok');
                            },
                          ),
                        );
                      },
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: tabela.length),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //botão entrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(60, 60),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Voltar'),
                  onPressed: () {
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'CompraColetiva');
                  },
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(60, 60),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: const Text('Salvar'),
                  onPressed: () {
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'CompraColetiva');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
