class Statut {
  final int id;
  final String libelle;

  Statut({
    required this.id,
    required this.libelle,
  });

  factory Statut.fromJson(Map<String, dynamic> json) {
    return Statut(
      id: json['id'],
      libelle: json['libelle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
    };
  }
}
