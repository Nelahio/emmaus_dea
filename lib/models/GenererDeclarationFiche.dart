class GenererDeclarationFiche {
  final String declarationId;
  final int ficheTracabiliteId;

  GenererDeclarationFiche({
    required this.declarationId,
    required this.ficheTracabiliteId,
  });

  factory GenererDeclarationFiche.fromJson(Map<String, dynamic> json) {
    return GenererDeclarationFiche(
      declarationId: json['id_declaration'],
      ficheTracabiliteId: json['id_fiche_tracabilite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_declaration': declarationId,
      'id_fiche_tracabilite': ficheTracabiliteId,
    };
  }
}
