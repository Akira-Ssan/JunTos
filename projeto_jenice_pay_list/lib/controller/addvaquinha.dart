import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/participante_model.dart';
import '../view/util.dart';
import 'login_controller.dart';

class TarefaController {
  //
  // ADICIONAR uma nova Tarefa
  //
  void adicionar(context, Vaquinha v) {
    FirebaseFirestore.instance
        .collection('vaquinhas')
        .add(v.toJson())
        .then((value) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a tarefa.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // ATUALIZAR
  //
  void atualizar(context, id, Vaquinha v) {
    FirebaseFirestore.instance
        .collection('vaquinhas')
        .doc(id)
        .update(v.toJson())
        .then((value) => sucesso(context, 'Tarefa atualizada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar a tarefa.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // EXCLUIR
  //
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('vaquinhas')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Tarefa excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a tarefa.'));
  }

  //
  // LISTAR todas as Tarefas da coleção
  //
  listar() {
    return FirebaseFirestore.instance
        .collection('vaquinhas')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}
