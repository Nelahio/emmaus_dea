class LivrerMeubleLivraison {
  final int meubleId;
  final int? livraisonId;
  final int quantiteLivree;

  LivrerMeubleLivraison({
    required this.meubleId,
    this.livraisonId,
    required this.quantiteLivree,
  });

  factory LivrerMeubleLivraison.fromJson(Map<String, dynamic> json) {
    return LivrerMeubleLivraison(
      meubleId: json['id_meuble'],
      livraisonId: json['id_livraison'],
      quantiteLivree: json['quantite_livree'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_meuble': meubleId,
      'id_livraison': livraisonId,
      'quantite_livree': quantiteLivree,
    };
  }
}
