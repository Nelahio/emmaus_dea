class FicheTracabiliteCollecte {
  final int ficheTracabiliteId;
  final int ramasseId;

  FicheTracabiliteCollecte({
    required this.ficheTracabiliteId,
    required this.ramasseId,
  });

  factory FicheTracabiliteCollecte.fromJson(Map<String, dynamic> json) {
    return FicheTracabiliteCollecte(
      ficheTracabiliteId: json['id_fiche_tracabilite'],
      ramasseId: json['id_ramasse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_fiche_tracabilite': ficheTracabiliteId,
      'id_ramasse': ramasseId,
    };
  }
}
