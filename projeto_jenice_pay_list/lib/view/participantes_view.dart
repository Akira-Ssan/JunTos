import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/repository/participantes_repo.dart';

class ParticipantesView extends StatefulWidget {
  const ParticipantesView({super.key});

  @override
  State<ParticipantesView> createState() => _ParticipantesViewState();
}

final txtNome = TextEditingController();

class _ParticipantesViewState extends State<ParticipantesView> {
  @override
  Widget build(BuildContext context) {
    final tabela = PessoaRepo.tabela;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popAndPushNamed(context, 'TelaMenu');
            },
          ),
          title: const Text('Cadastrar participantes'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: txtNome,
                //obscureText: true,
                style: const TextStyle(
                  fontSize: 22,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Entre com o nome',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 600,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, 'ParticipanteEditar');
                          },
                        ),
                        title: Text(tabela[index].nome),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.greenAccent,
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(
                                context, 'ParticipanteEditar');
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
        ));
  }
}
