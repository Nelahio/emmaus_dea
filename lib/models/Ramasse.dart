class Ramasse {
  final int Id;
  final int DonateurId;
  final String? NotesRamasse;
  final int CamionRamasse;
  final DateTime DateRamasse;
  final int TrancheHoraireId;
  final int? StatutRamasseId;

  Ramasse({
    required this.Id,
    required this.DonateurId,
    this.NotesRamasse,
    required this.CamionRamasse,
    required this.DateRamasse,
    required this.TrancheHoraireId,
    this.StatutRamasseId,
  });

  factory Ramasse.fromJson(Map<String, dynamic> json) {
    return Ramasse(
      Id: json['Id'],
      DonateurId: json['DonateurId'],
      NotesRamasse: json['NotesRamasse'],
      CamionRamasse: json['CamionRamasse'],
      DateRamasse: DateTime.parse(json['DateRamasse']),
      TrancheHoraireId: json['TrancheHoraireId'],
      StatutRamasseId: json['StatutRamasseId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'DonateurId': DonateurId,
      'NotesRamasse': NotesRamasse,
      'CamionRamasse': CamionRamasse,
      'DateRamasse': DateRamasse.toIso8601String(),
      'TrancheHoraireId': TrancheHoraireId,
      'StatutRamasseId': StatutRamasseId,
    };
  }
}
