class TracerFicheMeuble {
  final int ficheTracabiliteId;
  final int meubleId;
  final int quantite;

  TracerFicheMeuble({
    required this.ficheTracabiliteId,
    required this.meubleId,
    required this.quantite,
  });

  @override
  String toString() {
    return 'TracerFicheMeuble{FicheTracabiliteId: $ficheTracabiliteId, MeubleId: $meubleId, Quantite: $quantite}';
  }

  factory TracerFicheMeuble.fromJson(Map<String, dynamic> json) {
    return TracerFicheMeuble(
      ficheTracabiliteId: json['FicheTracabiliteId'],
      meubleId: json['MeubleId'],
      quantite: json['Quantite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FicheTracabiliteId': ficheTracabiliteId,
      'MeubleId': meubleId,
      'Quantite': quantite,
    };
  }
}
