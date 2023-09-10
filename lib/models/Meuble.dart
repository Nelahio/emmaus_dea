class Meuble {
  final int id;
  final String nom;
  final int poids;
  final int categorieMeubleId;

  Meuble({
    required this.id,
    required this.nom,
    required this.poids,
    required this.categorieMeubleId,
  });

  factory Meuble.fromJson(Map<String, dynamic> json) {
    return Meuble(
      id: json['id'],
      nom: json['nom'],
      poids: json['poids'],
      categorieMeubleId: json['id_categorie_meuble'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'poids': poids,
      'id_categorie_meuble': categorieMeubleId,
    };
  }
}
