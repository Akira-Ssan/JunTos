// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_jenice_pay_list/view/compra_coletiva_novo_editar_view.dart';
import 'package:projeto_jenice_pay_list/view/esqueci_a_senha_email_input_view.dart';
import 'package:projeto_jenice_pay_list/view/cadastro_login_view.dart';
import 'package:projeto_jenice_pay_list/view/gerenciar_compra_coletiva_view.dart';
import 'package:projeto_jenice_pay_list/view/gerenciar_inserir_pagamento_view.dart';
import 'package:projeto_jenice_pay_list/view/login_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:projeto_jenice_pay_list/view/participante_editar_view.dart';
import 'package:projeto_jenice_pay_list/view/participantes_view.dart';
import 'package:projeto_jenice_pay_list/view/principal_view.dart';
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
          'ParticipanteEditar': (context) => ParticipanteEditarView(),
          'Gerenciar': (context) => GerenciarView(),
          'GerenciarInserirPagamento': (context) => GerenciarPagamento(),
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
