import 'package:flutter/material.dart';

/// Flutter code sample for [Card].

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sobre')),
        body: Column(
          children: [
            const SizedBox(height: 10),
            const WidgetTeste(assetImage: 'assets/images/fatec.jpeg'),
            const SizedBox(height: 10),
            const Card(
              child: Text(
                  'O projeto de software JunTos visa facilitar a criação e o controle de compras coletivas (vulgarmente conhecido como vaquinha), permitindo que os usuários criem metas/objetivos com valores bem definidos, ficando a cargo do software fazer toda a administração dos pagamentos efetuados pelos participantes.'),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'Autores',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const DevsCard(
                imageasset: 'assets/images/rodrigo_plotze_professor_rec.png',
                titulo: 'Rodrigo Plotze',
                subtitulo:
                    'Docente curso ADS, FATECRP\nTech Lead do projeto JunTos'),
            const SizedBox(height: 10),
            const DevsCard(
                imageasset: 'assets/images/jenice_partner_about_rec.png',
                titulo: 'Jenice Júlio Correia de Lima',
                subtitulo:
                    'Discente curso ADS, FATECRP\nDev Sênior do projeto JunTos'),
            const SizedBox(height: 10),
            const DevsCard(
                imageasset: 'assets/images/flebersom_rec.png',
                titulo: 'Flebersom Bezerra',
                subtitulo:
                    'Descente curso ADS, FATECRP\nEstagiário Sênior do projeto JunTos'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(30, 40),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.popAndPushNamed(context, 'TelaMenu');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DevsCard extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String imageasset;

  const DevsCard(
      {super.key,
      required this.imageasset,
      required this.titulo,
      required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(imageasset),
              title: Text(titulo),
              subtitle: Text(subtitulo),
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}

class WidgetTeste extends StatelessWidget {
  final String assetImage;
  //final Color corDoTexto;

  const WidgetTeste({super.key, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset(assetImage) //Container(
      //child:
      //Text(
      //titulo,
      // style: TextStyle(color: corDoTexto),
      //);
      //);
    ]);
  }
}
