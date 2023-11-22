// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
//import 'package:projeto_jenice_pay_list/view/compra_coletiva_novo_editar_view.dart';
import 'view/cadastro_login_view.dart';
import 'view/gerenciar_compra_coletiva_view.dart';
//import 'package:projeto_jenice_pay_list/view/gerenciar_inserir_pagamento_view.dart';
import 'view/login_view.dart';
//import 'package:projeto_jenice_pay_list/view/participante_editar_view.dart';
//import 'package:projeto_jenice_pay_list/view/participantes_view.dart';
import 'view/inicio_view.dart';
import 'view/tela_menu_view.dart';
import 'view/compra_coletiva_view.dart';
import 'view/sobre_view.dart';

//Firebase inicialização
Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    //importante usar o Samsung Galaxy Note 20
    //para evitar problemas na tela
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,

        // rotas de navegação

        initialRoute: 'Inicio',
        routes: {
          'Inicio': (context) => InicioView(),
          'Login': (context) => LoginView(),
          'Cadastro': (context) => CadastroLoginView(),
          'TelaMenu': (context) => TelaMenu(),
          'CriarVaquinha': (context) => CompraColetiva(),
          //'CompraColetivaNEview': (context) => CompraColetivaNVview(),
          //'Participantes': (context) => ParticipantesView(),
          //'ParticipanteEditar': (context) => ParticipanteEditarView(),
          'Gerenciar': (context) => GerenciarView(),
          //'GerenciarInserirPagamento': (context) => GerenciarPagamento(),
          'Sobre': (context) => SobreView(),
          //'Cadastro':(context) => CadastroLoginView(),
        },
      ),
    ),
  );
}
