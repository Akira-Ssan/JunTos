import 'package:flutter/material.dart';

class ParticipanteEditarView extends StatefulWidget {
  const ParticipanteEditarView({super.key});

  @override
  State<ParticipanteEditarView> createState() => _ParticipanteEditarViewState();
}

class _ParticipanteEditarViewState extends State<ParticipanteEditarView> {
  final txteditnome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Voltar ao menu',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'Participantes');
          },
        ),
        title: const Text('Editar nome \$participante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: txteditnome,
              //obscureText: true,
              style: const TextStyle(
                fontSize: 22,
              ),
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite o novo nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //botão cadastrar
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(60, 60),
                    textStyle: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: const Text('Voltar'),
                  onPressed: () {
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'Participantes');
                    setState(() {});
                  },
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(60, 60),
                    textStyle: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  child: const Text('Salvar'),
                  onPressed: () {
                    //
                    //Ação ao pressionar o botão +
                    //
                    Navigator.pushNamed(context, 'Participantes');
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
