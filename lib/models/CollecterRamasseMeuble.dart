class CollecterRamasseMeuble {
  final int? ramasseId;
  final int meubleId;
  final int quantiteCollectee;

  CollecterRamasseMeuble({
    this.ramasseId,
    required this.meubleId,
    required this.quantiteCollectee,
  });

  factory CollecterRamasseMeuble.fromJson(Map<String, dynamic> json) {
    return CollecterRamasseMeuble(
      ramasseId: json['id_ramasse'],
      meubleId: json['id_meuble'],
      quantiteCollectee: json['quantite_collectee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_ramasse': ramasseId,
      'id_meuble': meubleId,
      'quantite_collectee': quantiteCollectee,
    };
  }
}
