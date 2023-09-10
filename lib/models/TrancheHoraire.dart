class TrancheHoraire {
  final int id;
  final Duration heureDebut;
  final Duration heureFin;

  TrancheHoraire({
    required this.id,
    required this.heureDebut,
    required this.heureFin,
  });

  factory TrancheHoraire.fromJson(Map<String, dynamic> json) {
    return TrancheHoraire(
      id: json['id'],
      heureDebut: Duration(milliseconds: json['heureDebut']),
      heureFin: Duration(milliseconds: json['heureFin']),
    );
  }
}
