import 'package:flutter/material.dart';

class UserCard2 extends StatefulWidget {
  final String titulo;
  final String subtitulo;

  const UserCard2({super.key, required this.titulo, required this.subtitulo});

  @override
  State<UserCard2> createState() => _UserCard2State();
}

class _UserCard2State extends State<UserCard2> {
  void exibirAlerta(context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Remover Vaquinha"),
              content:
                  const Text("Tem certeza que deseja remover essa vaquinha?"),
              actions: [
                TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, 'principal');
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 0, 182, 88),
                    padding: const EdgeInsets.all(14),
                    child: const Text(
                      "OK",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: ListTile(
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
                        exibirAlerta(context);
                      },
                    ),
                  )
                ]), //const Icon(Icons.more_vert))),
      ),
    );
  }
}
