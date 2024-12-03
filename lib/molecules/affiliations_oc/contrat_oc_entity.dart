class ContratOc {
  final String type;
  final String libelleContrat;
  final List<GarantieContratOc> garanties;

  ContratOc({
    required this.libelleContrat,
    required this.type,
    required this.garanties,
  });
}

class GarantieContratOc {
  final String libelleGarantie;
  bool souscrit;

  GarantieContratOc({
    required this.libelleGarantie,
    required this.souscrit,
  });
}
