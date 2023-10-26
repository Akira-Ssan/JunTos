import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/alert_dialogue_fn.dart';

class UserCard2 extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final double valor;
  //final int indexId;

  const UserCard2({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.valor,
    //required thid.indexId
  });

  @override
  State<UserCard2> createState() => _UserCard2State();
}

class _UserCard2State extends State<UserCard2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                leading: const FlutterLogo(size: 28),
                title: Text(
                  widget.titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.subtitulo),
                trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: ListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('Editar'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.popAndPushNamed(
                                    context, 'CompraColetivaNEview');
                                //Navigator.popAndPushNamed(context, 'NovoEditarVaquinha');
                              },
                            ),
                          ),
                          PopupMenuItem(
                            child: ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text('Remover'),
                              onTap: () {
                                Navigator.pop(context);
                                exibirAlerta(
                                    context,
                                    'Remover Vaquinha',
                                    'Tem certeza que deseja remover essa vaquinha?',
                                    'cancel_yes');
                              },
                            ),
                          )
                        ]),
                //const Icon(Icons.more_vert))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'R\$ ${widget.valor.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
