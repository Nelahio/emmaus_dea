import 'TracerFicheMeuble.dart';

class FicheTracabilite {
  final int Id;
  final DateTime DateFiche;
  final int ProvenanceId;
  final int? RamasseId;
  final List<TracerFicheMeuble> TracerFicheMeubles;

  FicheTracabilite({
    required this.Id,
    required this.DateFiche,
    required this.ProvenanceId,
    this.RamasseId,
    required this.TracerFicheMeubles,
  });

  @override
  String toString() {
    return 'FicheTracabilite{Id: $Id, DateFiche: $DateFiche, ProvenanceId: $ProvenanceId, TracerFicheMeubles: $TracerFicheMeubles}';
  }

  factory FicheTracabilite.fromJson(Map<String, dynamic> json) {
    final List<dynamic> tracerFicheMeublesList =
        json['TracerFicheMeubles'] ?? [];
    final List<TracerFicheMeuble> tracerFicheMeubles = tracerFicheMeublesList
        .map((data) => TracerFicheMeuble.fromJson(data))
        .toList();

    return FicheTracabilite(
      Id: json['Id'],
      DateFiche: DateTime.parse(json['DateFiche']),
      ProvenanceId: json['ProvenanceId'],
      RamasseId: json['RamasseId'],
      TracerFicheMeubles: tracerFicheMeubles,
    );
  }
}
