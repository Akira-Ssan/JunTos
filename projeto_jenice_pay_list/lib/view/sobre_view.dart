import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/devs_card.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/load_image.dart';

/// Flutter code sample for [Card].

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const LoadImage(assetImage: 'assets/images/fatec.png'),

          ///media/flebersom/KINGSTON/Apps/projeto2/projeto_jenice_pay_list/
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
              titulo: 'Rodrigo Plotze | Professor | Pesquisador',
              subtitulo:
                  'Docente curso ADS, FATECRP\nTech Lead do projeto JunTos\nrodrigo.plotze@fatec.sp.gov.br'),
          const SizedBox(height: 10),
          const DevsCard(
              imageasset: 'assets/images/jenice_partner_about_rec.png',
              titulo:
                  'Jenice Júlio Correia de Lima | Estudante\njenice.lima@fatec.sp.gov.br',
              subtitulo:
                  'Discente curso ADS, FATECRP\nDev Sênior do projeto JunTos'),
          const SizedBox(height: 10),
          const DevsCard(
              imageasset: 'assets/images/flebersom_rec.png',
              titulo: 'Flebersom Bezerra | Estudante',
              subtitulo:
                  'Discente curso ADS, FATECRP\nEstagiário Sênior do projeto JunTos\nflebersom.bezerra@fatec.sp.gov.br'),
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
    );
  }
}
