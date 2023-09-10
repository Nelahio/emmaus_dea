class Provenance {
  final int Id;
  final String Nom;

  const Provenance({
    required this.Id,
    required this.Nom,
  });

  factory Provenance.fromJson(Map<String, dynamic> json) {
    return Provenance(
      Id: json['Id'],
      Nom: json['Nom'],
    );
  }
}
