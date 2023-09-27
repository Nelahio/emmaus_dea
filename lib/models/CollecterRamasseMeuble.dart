class CollecterRamasseMeuble {
  final int RamasseId;
  final int MeubleId;
  final int QuantiteCollectee;

  CollecterRamasseMeuble({
    required this.RamasseId,
    required this.MeubleId,
    required this.QuantiteCollectee,
  });

  factory CollecterRamasseMeuble.fromJson(Map<String, dynamic> json) {
    return CollecterRamasseMeuble(
      RamasseId: json['id_ramasse'],
      MeubleId: json['id_meuble'],
      QuantiteCollectee: json['quantite_collectee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_ramasse': RamasseId,
      'id_meuble': MeubleId,
      'quantite_collectee': QuantiteCollectee,
    };
  }
}
