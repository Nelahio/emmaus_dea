class Meuble {
  final int Id;
  final String Nom;
  final int Poids;
  final int CategorieMeubleId;

  Meuble({
    required this.Id,
    required this.Nom,
    required this.Poids,
    required this.CategorieMeubleId,
  });

  factory Meuble.fromJson(Map<String, dynamic> json) {
    return Meuble(
      Id: json['Id'],
      Nom: json['Nom'],
      Poids: json['Poids'],
      CategorieMeubleId: json['CategorieMeubleId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Nom': Nom,
      'Poids': Poids,
      'CategorieMeubleId': CategorieMeubleId,
    };
  }
}
