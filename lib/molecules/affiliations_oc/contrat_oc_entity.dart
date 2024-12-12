class ContratOcWithGaranties {
  final String id;
  final String type;
  final String libelleContrat;
  final List<GarantieContratOc> garanties;

  ContratOcWithGaranties({
    required this.id,
    required this.libelleContrat,
    required this.type,
    required this.garanties,
  });
}

class GarantieContratOc {
  final String libelleGarantie;
  final String id;
  bool souscrit;

  GarantieContratOc({
    required this.libelleGarantie,
    required this.id,
    required this.souscrit,
  });
}
