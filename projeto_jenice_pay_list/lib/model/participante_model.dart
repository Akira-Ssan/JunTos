class Pessoa {
  String nome;

  Pessoa({required this.nome});
}

//
class Participante {
  String nome;
  double valorDado;

  Participante(this.nome, this.valorDado);
}

class ListaParticipantes {
  List<Participante> participantes = [];

  void adicionarParticipante(String nome, double valorDado) {
    participantes.add(Participante(nome, valorDado));
  }

  void removerParticipante(int index) {
    if (index >= 0 && index < participantes.length) {
      participantes.removeAt(index);
    }
  }
}

class Vaquinha {
  String uid;
  String titulo;
  String descricao;
  double valor;
  ListaParticipantes listaParticipantes = ListaParticipantes();

  Vaquinha(this.uid, this.titulo, this.descricao, this.valor);

  factory Vaquinha.fromJson(Map<String, dynamic> json) {
    final participantesJson = json['listaParticipantes'] as List<dynamic>;
    final listaParticipantes = ListaParticipantes();

    for (var participanteJson in participantesJson) {
      final nome = participanteJson['nome'] as String;
      final valorDado = participanteJson['valorDado'] as double;
      listaParticipantes.adicionarParticipante(nome, valorDado);
    }

    return Vaquinha(
      json['uid'] as String,
      json['titulo'] as String,
      json['descricao'] as String,
      json['valor'] as double,
    )..listaParticipantes = listaParticipantes;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'listaParticipantes': listaParticipantes.participantes
          .map((p) => {
                'nome': p.nome,
                'valorDado': p.valorDado,
              })
          .toList(),
    };
  }

  int quantidadeDeParticipantes() {
    return listaParticipantes.participantes.length;
  }

  double totalValorDadoPorParticipantes() {
    double total = 0;
    for (var participante in listaParticipantes.participantes) {
      total += participante.valorDado;
    }
    return total;
  }
}

/*
void main() {
  String jsonString = '{"uid": "1", "titulo": "Festa de Aniversário", "descricao": "Contribuição para a festa de aniversário", "valor": 100.0, "listaParticipantes": [{"nome": "Alice", "valorDado": 10.0}, {"nome": "Bob", "valorDado": 15.0}]}';

  Map<String, dynamic> vaquinhaJson = json.decode(jsonString);

  Vaquinha vaquinha = Vaquinha.fromJson(vaquinhaJson);

  print("UID: ${vaquinha.uid}");
  print("Vaquinha: ${vaquinha.titulo}");
  print("Descrição: ${vaquinha.descricao}");
  print("Valor Total: ${vaquinha.valor}");

  print("Lista de Participantes:");
  for (var participante in vaquinha.listaParticipantes.participantes) {
    print("Nome: ${participante.nome}, Valor Dado: ${participante.valorDado}");
  }

  print("Quantidade de Participantes: ${vaquinha.quantidadeDeParticipantes()}");
  print("Total Valor Dado por Participantes: ${vaquinha.totalValorDadoPorParticipantes()}");

  Map<String, dynamic> vaquinhaJsonToEncode = vaquinha.toJson();
  String jsonStringToEncode = json.encode(vaquinhaJsonToEncode);
  print("JSON Serializado: $jsonStringToEncode");
}
*/
