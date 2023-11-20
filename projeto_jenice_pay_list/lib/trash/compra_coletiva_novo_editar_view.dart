import 'package:flutter/material.dart';

class CompraColetivaNVview extends StatefulWidget {
  const CompraColetivaNVview({super.key});

  @override
  State<CompraColetivaNVview> createState() => _CompraColetivaNVviewState();
}

class _CompraColetivaNVviewState extends State<CompraColetivaNVview> {
  final txtTitulo = TextEditingController();
  final txtSubtitulo = TextEditingController();
  final txtValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
//
//Recuperando os dados da vaquinha para Editar/Criar
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
        title: const Text('Nova vaquinha / Editar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: txtTitulo,
              style: const TextStyle(
                fontSize: 22,
              ),
              decoration: const InputDecoration(
                labelText: 'Titulo',
                hintText: 'Entre com título da vaquinhna',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtSubtitulo,
              maxLines: 2,
              //obscureText: true,
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Uma breve descrição',
                border: OutlineInputBorder(),
                //hintMaxLines: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtValor,

              //obscureText: true,
              style: const TextStyle(
                fontSize: 22,
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //botão entrar
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
                    Navigator.pushNamed(context, 'CompraColetiva');
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
