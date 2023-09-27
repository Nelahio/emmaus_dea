class Statut {
  final int Id;
  final String Libelle;

  Statut({
    required this.Id,
    required this.Libelle,
  });

  factory Statut.fromJson(Map<String, dynamic> json) {
    return Statut(
      Id: json['Id'],
      Libelle: json['Libelle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Libelle': Libelle,
    };
  }
}
