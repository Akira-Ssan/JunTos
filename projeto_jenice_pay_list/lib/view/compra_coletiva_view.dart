import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_jenice_pay_list/controller/login_controller.dart';
import '../controller/tarefa_controller.dart';
import 'package:flutter/material.dart';
import '../model/participante_model.dart';

class CompraColetiva extends StatefulWidget {
  const CompraColetiva({super.key});

  @override
  State<CompraColetiva> createState() => _CompraColetivaState();
}

class _CompraColetivaState extends State<CompraColetiva> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();
  var txtValor = TextEditingController();
  var txtNomePaticipante = TextEditingController();
  var txtMudaNome = TextEditingController();
  var lista = ListaParticipantes();
  String tituloPrincipal = "Criar vaquinha";
  dynamic docID;
  final listaNomes = [
    'Murilo Chellegatti',
    'Murilo Francisco',
    'Murilo L. Manfre',
    'Yan Ken Po',
    'Lucas',
    'Ronald MC',
    'Jenice',
    'Guilherme F. A. Rodrigues',
    'Gabriel José',
    'Gabriel L. Figueiredo',
    'Gabriel Souza',
    'Gabriel Só',
    'Testa de Léo',
    'Curva de Plotze',
    'Ângelo Marcari',
    'Luis F. N. Barcheschi'
        'Akira-Ssan'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//
    //Recuperando os dados da vaquinha para Editar
    //
    var rotaAtual = ModalRoute.of(context);

    //Verificando se foi passado uma vaquinha como argumento junto com seu id
    if (rotaAtual != null && rotaAtual.settings.arguments != null) {
      //preenchendo as variáveis para edição da vaquinha
      var argsList = rotaAtual.settings.arguments as List<dynamic>;
      var vaquinha = argsList[0] as Vaquinha;
      docID = argsList[1];
      txtTitulo.text = vaquinha.titulo;
      txtDescricao.text = vaquinha.descricao;
      txtValor.text = vaquinha.valor.toStringAsFixed(2);
      lista = vaquinha.listaParticipantes;
      tituloPrincipal = "Editar vaquinha";
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 50),
        child: Column(
          children: [
            //
            //Textfield Titulo
            //
            Text(
              tituloPrincipal,
              style: const TextStyle(fontSize: 28),
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
              controller: txtDescricao,
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
                    if (txtNomePaticipante.text.isNotEmpty) {
                      setState(() {
                        lista.adicionarParticipante(
                            txtNomePaticipante.text, 0.0);
                        txtNomePaticipante.clear();
                      });
                    } else {
                      Random r = Random();
                      var nome = listaNomes[r.nextInt(listaNomes.length)];
                      setState(() {
                        lista.adicionarParticipante(nome, 0.0);
                        txtNomePaticipante.clear();
                      });
                    }
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
                  height: 430,
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
                              //Botão remover participante
                              //
                              setState(() {
                                lista.removerParticipante(index);
                                //
                              });
                            },
                            //
                          ),
                          title: Text(lista.participantes[index].nome,
                              style: const TextStyle(fontSize: 12)),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                            onPressed: () {
                              txtMudaNome.text =
                                  lista.participantes[index].nome;

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                        'Mudar o nome do participante'),
                                    content: SizedBox(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Digite o novo nome",
                                          ),
                                          const SizedBox(height: 25),
                                          TextField(
                                            controller: txtMudaNome,
                                            decoration: const InputDecoration(
                                              labelText: 'nome',
                                              prefixIcon:
                                                  Icon(Icons.change_circle),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actionsPadding: const EdgeInsets.all(20),
                                    actions: [
                                      //
                                      //Botão cancelar a mudança de nome
                                      //
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      //
                                      //Botão salvar a mudança de nome
                                      //
                                      ElevatedButton(
                                        onPressed: () {
                                          if (txtMudaNome.text.isEmpty) {
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(
                                                context, txtMudaNome.text);
                                          }
                                        },
                                        child: const Text('Salvar'),
                                      ),
                                    ],
                                  );
                                },
                              ).then((nome) {
                                setState(() {
                                  lista.participantes[index].nome = nome;
                                });
                              });
                            },
                          ),
                        );
                      },
                      padding: const EdgeInsets.all(10),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: lista.participantes.length),
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
                    Navigator.popAndPushNamed(context, 'TelaMenu');
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

                    var v = Vaquinha(
                        LoginController().idUsuario(),
                        txtTitulo.text,
                        txtDescricao.text,
                        double.parse(txtValor.text),
                        lista.quantidadeDeParticipantes(),
                        lista.totalValorDadoPorParticipantes(),
                        participantes: lista.participantes);
                    //
                    //limpando os controladores de texto
                    //
                    txtTitulo.clear();
                    txtDescricao.clear();
                    txtValor.clear();
                    //
                    //Direcionando o modo de salvar a vaquinha
                    //
                    if (docID == null) {
                      //
                      // Adicionar vaquinha
                      //
                      TarefaController().adicionar(context, v);
                    } else {
                      //
                      // Atualizar vaquinha
                      //
                      TarefaController().atualizar(context, docID, v);
                    }
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
