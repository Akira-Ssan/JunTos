// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/compra_coletiva_novo_editar_view.dart';
import 'package:projeto_jenice_pay_list/view/esqueci_a_senha_email_input_view.dart';
import 'package:projeto_jenice_pay_list/view/cadastro_login_view.dart';
import 'package:projeto_jenice_pay_list/view/gerenciar_compra_coletiva_view.dart';
import 'package:projeto_jenice_pay_list/view/login_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto_jenice_pay_list/view/participantes_view.dart';
import 'package:projeto_jenice_pay_list/view/tela_menu_view.dart';
import 'package:projeto_jenice_pay_list/view/compra_coletiva_view.dart';
import 'package:projeto_jenice_pay_list/view/sobre_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,

        //home: CadastroLoginView(),

        // rotas de navegação

        initialRoute: 'Principal',
        routes: {
          'Principal': (context) => PrincipalView(),
          'Login': (context) => LoginView(),
          'Cadastro': (context) => CadastroLoginView(),
          'EsqueciSenha': (context) => EsqueciSenhaEmail(),
          'TelaMenu': (context) => TelaMenu(),
          'CompraColetiva': (context) => CompraColetiva(),
          'CompraColetivaNEview': (context) => CompraColetivaNVview(),
          'Participantes': (context) => ParticipantesView(),
          'Gerenciar': (context) => GerenciarView(),
          'Sobre': (context) => SobreView(),
          //'Cadastro':(context) => CadastroLoginView(),
        },
      ),
    ),
  );
}

//
// TELA PRINCIPAL
// Stateless = stl
//String texto = 'SE-LIGA DOIDÃO', texto1 = 'CUMÉ QUE TÁ CUMPADE';
class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // alinhamento vertical
        mainAxisAlignment: MainAxisAlignment.center,
        //alinhamento horizontal
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Icon(
            Icons.radio_button_checked,
            color: Colors.blueGrey,
            size: 120.0,
          ),

          SizedBox(
            width: double.infinity,
            height: 20,
          ),

          Text('Flutter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900,
              )),
          //Text('Calculadora construída com o framework Flutter'),
          Text('ONONONONONONONONON',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              )),

          SizedBox(
            width: double.infinity,
            height: 40,
          ),

          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              minimumSize: Size(180, 36),
            ),
            onPressed: () {
              //navegar para rota
              Navigator.pushNamed(context, 'Login');
            },
            child: Text('Entrar'),
          ),

          /*Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Pug_dog.jpg/1200px-Pug_dog.jpg',
          )
          */
        ],
      ),
    );
  }
}
