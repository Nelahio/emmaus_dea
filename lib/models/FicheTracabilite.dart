class FicheTracabilite {
  final int Id;
  final DateTime DateFiche;
  final int ProvenanceId;

  const FicheTracabilite(
      {required this.Id, required this.DateFiche, required this.ProvenanceId});

  factory FicheTracabilite.fromJson(Map<String, dynamic> json) {
    return FicheTracabilite(
        Id: json['Id'],
        DateFiche: DateTime.parse(json['DateFiche']),
        ProvenanceId: json['ProvenanceId']);
  }
}
