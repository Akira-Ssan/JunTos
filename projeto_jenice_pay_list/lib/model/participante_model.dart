class Participante {
  String nome;
  double valorDado;

  Participante(this.nome, this.valorDado);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'valorDado': valorDado,
    };
  }
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

  int quantidadeDeParticipantes() {
    return participantes.length;
  }

  double totalValorDadoPorParticipantes() {
    double total = 0;
    for (var participante in participantes) {
      total += participante.valorDado;
    }
    return total;
  }
}

class Vaquinha {
  String uid;
  String titulo;
  String descricao;
  double valor;
  int qtdParticipantes;
  double valorTotalParticipantes;
  ListaParticipantes listaParticipantes = ListaParticipantes();

  Vaquinha(this.uid, this.titulo, this.descricao, this.valor,
      this.qtdParticipantes, this.valorTotalParticipantes,
      {required List<Participante> participantes}) {
    listaParticipantes.participantes = participantes;
  }

  void atualizaQuantidadeParticipantes() {
    qtdParticipantes = listaParticipantes.participantes.length;
  }

  void atualizaValorTotalParticipantes() {
    valorTotalParticipantes =
        listaParticipantes.totalValorDadoPorParticipantes();
  }

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
      json['qtdParticipantes'] as int,
      json['valorTotalParticipantes'] as double,
      participantes: listaParticipantes.participantes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'qtdParticipantes': qtdParticipantes,
      'valorTotalParticipantes': valorTotalParticipantes,
      'listaParticipantes':
          listaParticipantes.participantes.map((p) => p.toJson()).toList(),
    };
  }
}
