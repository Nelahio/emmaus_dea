import 'Meuble.dart';

class TracerFicheMeuble {
  final int ficheTracabiliteId;
  final int meubleId;
  final int quantite;
  final Meuble meuble;

  TracerFicheMeuble(
      {required this.ficheTracabiliteId,
      required this.meubleId,
      required this.quantite,
      required this.meuble});

  @override
  String toString() {
    return 'TracerFicheMeuble{FicheTracabiliteId: $ficheTracabiliteId, MeubleId: $meubleId, Quantite: $quantite}';
  }

  factory TracerFicheMeuble.fromJson(Map<String, dynamic> json) {
    final meubleJson = json['Meuble'];
    final meuble = Meuble.fromJson(meubleJson);

    return TracerFicheMeuble(
      ficheTracabiliteId: json['FicheTracabiliteId'],
      meubleId: json['MeubleId'],
      quantite: json['Quantite'],
      meuble: meuble,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FicheTracabiliteId': ficheTracabiliteId,
      'MeubleId': meubleId,
      'Quantite': quantite,
      'Meuble': meuble.toJson(),
    };
  }
}
