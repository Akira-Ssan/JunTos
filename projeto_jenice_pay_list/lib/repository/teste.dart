import '../model/participante_model.dart';

class Membros {
  List<Participante> participante = [
    Participante('Kakashi Hatake', 150.0),
    Participante('Hianata Hyuga', 25.0),
    Participante('Sakura Haruno', 50.0),
    Participante('Gaara', 60.0),
    Participante('Jiraya', 10.50),
    Participante('Shikamaru Nara', 0.0),
    Participante('Asuma Sarutobi', 55.25),
    Participante('Temari', 85.0),
    Participante('Killer Bee', 500.0)
  ];
}

class Membros1 {
  List<Participante> participante = [
    Participante('Hermione Granger', 5.0),
    Participante('Draco Malfoy', 7.0),
    Participante('Luna Lovegood', 10.0),
    Participante('Lord Voldemort', 2.0),
    Participante('Sirius Black', 0.50),
    Participante('Cho Chang', 1.0),
    Participante('Regulus Black', 2.0),
    Participante('Astoria Greengrass', 35.0)
  ];
}

Vaquinha vaquis = Vaquinha(
    'AuWid',
    'Comprar Raspberry Pi 5',
    'Vaquinha para comprar o Raspberry Pi5 para presentear o professor Tanaka.',
    999.0,
    null,
    null,
    participantes: Membros().participante);

class ListaVaquis {
  List<Vaquinha> listaVaquinhas = [
    Vaquinha(
        'AuWid',
        'Comprar mascote do Flutter',
        'Vaquinha para comprar Dash o mascote de pelúcia do Flutter, presente para o Prof. Plotze',
        99.0,
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
