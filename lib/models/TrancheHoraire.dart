class TrancheHoraire {
  final int Id;
  final Duration HeureDebut;
  final Duration HeureFin;

  TrancheHoraire({
    required this.Id,
    required this.HeureDebut,
    required this.HeureFin,
  });

  factory TrancheHoraire.fromJson(Map<String, dynamic> json) {
    return TrancheHoraire(
      Id: json['Id'],
      HeureDebut: Duration(milliseconds: json['HeureDebut']),
      HeureFin: Duration(milliseconds: json['HeureFin']),
    );
  }
}
