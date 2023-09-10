import 'Livraison.dart';

class FicheTracabiliteReemploi {
  final int idFicheTracabilite;
  final List<Livraison>? livraisons;

  FicheTracabiliteReemploi({
    required this.idFicheTracabilite,
    this.livraisons,
  });

  factory FicheTracabiliteReemploi.fromJson(Map<String, dynamic> json) {
    return FicheTracabiliteReemploi(
      idFicheTracabilite: json['id_fiche_tracabilite'],
      livraisons: (json['livraisons'] as List<dynamic>?)
          ?.map((livraison) => Livraison.fromJson(livraison))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_fiche_tracabilite': idFicheTracabilite,
      'livraisons': livraisons?.map((livraison) => livraison.toJson()).toList(),
    };
  }
}
