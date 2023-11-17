import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/devs_card.dart';
import 'package:projeto_jenice_pay_list/view/custom_widgets_view/load_image.dart';

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
          const SizedBox(height: 10),
          const Card(
            child: Text(
                '^\'qp\'^\nO software JunTos foi desenvolvido para simplificar a organização e gestão de vaquinhas. Ele possibilita que os usuários estabeleçam metas e objetivos com valores específicos, enquanto a plataforma se encarrega da administração dos pagamentos realizados pelos participantes.',
                style: TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
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
