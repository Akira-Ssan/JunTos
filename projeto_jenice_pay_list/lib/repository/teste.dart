import '../model/participante_model.dart';

class Membros {
  List<Participante> participante = [
    Participante('Jannet', 30.0),
    Participante('Jão', 25.0),
    Participante('Josué', 50.0),
    Participante('Verônica Vaz', 105.0),
    Participante('Giana', 1.50),
    Participante('Tandréia', 0.0),
    Participante('Angelicia', 55.25),
    Participante('Valdelicia', 85.0)
  ];
}

class Membros1 {
  List<Participante> participante = [
    Participante('Taveira', 50.0),
    Participante('Pelezito', 75.0),
    Participante('Maria Homem', 105.0),
    Participante('Val de Morte', 250.0),
    Participante('Geleiana', 550.50),
    Participante('Tamirez', 1.0),
    Participante('Angelita', 20.25),
    Participante('Valdirene', 35.0)
  ];
}

Vaquinha vaquis = Vaquinha(
    'AuWid',
    'Comprar Rasperry Pi 5.000',
    'Vaquinha para comprar o Rasperry Pi 5.000 para o professor Tanaka. Se com o Rasperry 0 ele já milagres...',
    5000.0,
    null,
    null,
    participantes: Membros().participante);

class ListaVaquis {
  List<Vaquinha> listaVaquinhas = [
    Vaquinha(
        'AuWid',
        'Comprar ovo de dragão',
        'Dizem que dormir todos os dias ao lado deum ovo de dragão dá sorte na programação.',
        5000.0,
        null,
        null,
        participantes: Membros1().participante)
  ];

  void addv(Vaquinha v) {
    listaVaquinhas.add(v);
  }
  /* Vaquinha(
    'AuWid',
    'Comprar ovo de dragão',
    'Dizem que dormir todos os dias ao lado deum ovo de dragão dá sorte na programação.',
    5000.0,
    null,
    null,
    participantes: Membros().participante)
  ]*/
}
