class LivrerMeubleLivraison {
  final int MeubleId;
  final int LivraisonId;
  final int QuantiteLivree;

  LivrerMeubleLivraison({
    required this.MeubleId,
    required this.LivraisonId,
    required this.QuantiteLivree,
  });

  factory LivrerMeubleLivraison.fromJson(Map<String, dynamic> json) {
    return LivrerMeubleLivraison(
      MeubleId: json['MeubleId'],
      LivraisonId: json['LivraisonId'],
      QuantiteLivree: json['QuantiteLivree'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MeubleId': MeubleId,
      'LivraisonId': LivraisonId,
      'QuantiteLivree': QuantiteLivree,
    };
  }
}
