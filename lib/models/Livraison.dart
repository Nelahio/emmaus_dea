class Livraison {
  final int Id;
  final int TrancheHoraireId;
  final int ClientId;
  final String? NotesLivraison;
  final int CamionLivraison;
  final DateTime DateLivraison;
  final int? StatutLivraisonId;
  final int ficheTracabiliteReemploiId;

  Livraison({
    required this.Id,
    required this.TrancheHoraireId,
    required this.ClientId,
    this.NotesLivraison,
    required this.CamionLivraison,
    required this.DateLivraison,
    this.StatutLivraisonId,
    required this.ficheTracabiliteReemploiId,
  });

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
      Id: json['Id'],
      TrancheHoraireId: json['TrancheHoraireId'],
      ClientId: json['ClientId'],
      NotesLivraison: json['NotesLivraison'],
      CamionLivraison: json['CamionLivraison'],
      DateLivraison: DateTime.parse(json['DateLivraison']),
      StatutLivraisonId: json['StatutLivraisonId'],
      ficheTracabiliteReemploiId: json['FicheTracabiliteReemploiId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'TrancheHoraireId': TrancheHoraireId,
      'ClientId': ClientId,
      'NotesLivraison': NotesLivraison,
      'CamionLivraison': CamionLivraison,
      'DateLivraison': DateLivraison.toIso8601String(),
      'StatutLivraisonId': StatutLivraisonId,
      'FicheTracabiliteReemploiId': ficheTracabiliteReemploiId,
    };
  }
}
