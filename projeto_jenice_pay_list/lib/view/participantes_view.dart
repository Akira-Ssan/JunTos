import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Column,
        Divider,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        InputDecoration,
        ListTile,
        ListView,
        MainAxisAlignment,
        Navigator,
        OutlineInputBorder,
        Padding,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextField,
        TextStyle,
        Widget;
import 'package:projeto_jenice_pay_list/repository/participantes_repo.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/alert_dialogue_fn.dart';

class ParticipantesView extends StatefulWidget {
  const ParticipantesView({super.key});

  @override
  State<ParticipantesView> createState() => _ParticipantesViewState();
}

final txtNome = TextEditingController();

class _ParticipantesViewState extends State<ParticipantesView> {
  @override
  Widget build(BuildContext context) {
    var tabela = PessoaRepo.tabela;

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
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Entre com o nome',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.abc_outlined),
                  suffix: IconButton(
                    icon: const Icon(Icons.person_add_alt_1),
                    tooltip: 'Adicionar participante',
                    onPressed: () {},
                  ),
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
                            exibirAlerta(context, 'Editar nome do participante',
                                'Digite o novo nome:', 'input_ok');
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
