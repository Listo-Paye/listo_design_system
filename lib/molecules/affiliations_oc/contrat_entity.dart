class ContratsOcdata {
  final String libelleContrat;
  final List<Garanties> garanties;

  ContratsOcdata({
    required this.libelleContrat,
    required this.garanties,
  });
}

class Garanties {
  final String libelleGarantie;
  final bool souscrit;

  Garanties({
    required this.libelleGarantie,
    required this.souscrit,
  });
}
