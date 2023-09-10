class TracerFicheMeuble {
  final int ficheTracabiliteId;
  final int meubleId;
  final int quantite;

  TracerFicheMeuble({
    required this.ficheTracabiliteId,
    required this.meubleId,
    required this.quantite,
  });

  factory TracerFicheMeuble.fromJson(Map<String, dynamic> json) {
    return TracerFicheMeuble(
      ficheTracabiliteId: json['ficheTracabiliteId'],
      meubleId: json['meubleId'],
      quantite: json['quantite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ficheTracabiliteId': ficheTracabiliteId,
      'meubleId': meubleId,
      'quantite': quantite,
    };
  }
}
