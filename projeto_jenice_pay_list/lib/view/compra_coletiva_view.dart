import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/model/participante_model.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/alert_dialogue_fn.dart';

class CompraColetiva extends StatefulWidget {
  const CompraColetiva({super.key});

  @override
  State<CompraColetiva> createState() => _CompraColetivaState();
}

class _CompraColetivaState extends State<CompraColetiva> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txtValor = TextEditingController();
  var txtNomePaticipante = TextEditingController();
  var partici = ListaParticipantes();

  @override
  void initState() {
    //partici.adicionarParticipante('Jenice', 0.0);
    //partici.adicionarParticipante('Plotze', 0.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var tabela = PessoaRepo.tabela;

    return Scaffold(
      /*appBar: AppBar(
        leading: IconButton(
          //tooltip: 'Voltar ao menu',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'TelaMenu');
          },
        ),
        title: const Text('Nova vaquinha'),
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 50),
        child: Column(
          children: [
            //
            //Textfield Titulo
            //
            const Text(
              'Criar Vaquinha',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtTitulo,
              style: const TextStyle(
                fontSize: 14,
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
            //
            //Textfield Descrição
            //
            TextField(
              controller: txtSubtitulo,
              maxLines: 2,
              //obscureText: true,
              style: const TextStyle(
                fontSize: 14,
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
            //
            //Textfield Valor da vaquinha
            //
            TextField(
              controller: txtValor,

              //obscureText: true,
              style: const TextStyle(
                fontSize: 14,
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
              height: 10,
            ),
            //
            //
            TextField(
              controller: txtNomePaticipante,
              //obscureText: true,
              style: const TextStyle(
                fontSize: 14,
              ),
              decoration: InputDecoration(
                labelText: 'Participantes',
                hintText: 'Entre com o nome do participante',
                border: const OutlineInputBorder(),
                //prefixIcon: const Icon(Icons.person),
                //
                //Bogtão para inserção de participantes
                //
                suffix: IconButton(
                  icon: const Icon(Icons.person_add_alt_1),
                  tooltip: 'Adicionar participante',
                  onPressed: () {
                    setState(() {
                      partici.adicionarParticipante(
                          txtNomePaticipante.text, 0.0);
                      txtNomePaticipante.clear();
                    });
                  },
                ),
                //
                //
                //
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SizedBox(
                  height: 300,
                  //
                  //Lista participantes add vaquinha
                  //
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: IconButton(
                            icon: const Icon(Icons.person_remove),
                            color: Colors.redAccent,
                            onPressed: () {
                              //
                              exibirAlerta(
                                  context,
                                  'Remover participante',
                                  'Tem certesa que deseja remover o participante?',
                                  'cancel_yes');
                            },
                            //
                          ),
                          title: Text(partici.participantes[index].nome,
                              style: const TextStyle(fontSize: 12)),
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
                      padding: const EdgeInsets.all(10),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: partici.participantes.length),
                ),
              ],
            ),
            //
            const Divider(),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                //botão voltar
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(45, 45),
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  child: const Text('Voltar'),
                  onPressed: () {
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pop(context);
                  },
                ),
                //
                //Botão Salvar
                //
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(45, 45),
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  child: const Text('Salvar'),
                  onPressed: () {
                    //
                    //Ação para salvar a vaquinha no banco de dados
                    //
                    Navigator.pushNamed(context, 'TelaMenu');
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
