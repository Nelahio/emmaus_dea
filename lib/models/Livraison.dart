class Livraison {
  final int id;
  final int trancheHoraireId;
  final String nomClient;
  final String? prenomClient;
  final String adresseClient;
  final String codePostalClient;
  final String villeClient;
  final String? residenceClient;
  final String? batimentClient;
  final int etageClient;
  final bool avecAscenseur;
  final String telephoneClient;
  final String? mailClient;
  final String? notesLivraison;
  final int camionLivraison;
  final DateTime dateLivraison;
  final int statutLivraisonId;
  final int ficheTracabiliteReemploiId;

  Livraison({
    required this.id,
    required this.trancheHoraireId,
    required this.nomClient,
    this.prenomClient,
    required this.adresseClient,
    required this.codePostalClient,
    required this.villeClient,
    this.residenceClient,
    this.batimentClient,
    required this.etageClient,
    required this.avecAscenseur,
    required this.telephoneClient,
    this.mailClient,
    this.notesLivraison,
    required this.camionLivraison,
    required this.dateLivraison,
    required this.statutLivraisonId,
    required this.ficheTracabiliteReemploiId,
  });

  factory Livraison.fromJson(Map<String, dynamic> json) {
    return Livraison(
      id: json['id'],
      trancheHoraireId: json['id_tranche_horaire'],
      nomClient: json['nom_client'],
      prenomClient: json['prenom_client'],
      adresseClient: json['adresse_client'],
      codePostalClient: json['code_postal_client'],
      villeClient: json['ville_client'],
      residenceClient: json['residence_client'],
      batimentClient: json['batiment_client'],
      etageClient: json['etage_client'],
      avecAscenseur: json['avec_ascenseur'],
      telephoneClient: json['telephone_client'],
      mailClient: json['mail_client'],
      notesLivraison: json['notes_livraison'],
      camionLivraison: json['camion_livraison'],
      dateLivraison: DateTime.parse(json['date_livraison']),
      statutLivraisonId: json['id_statut_livraison'],
      ficheTracabiliteReemploiId: json['id_fiche_tracabilite_reemploi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_tranche_horaire': trancheHoraireId,
      'nom_client': nomClient,
      'prenom_client': prenomClient,
      'adresse_client': adresseClient,
      'code_postal_client': codePostalClient,
      'ville_client': villeClient,
      'residence_client': residenceClient,
      'batiment_client': batimentClient,
      'etage_client': etageClient,
      'avec_ascenseur': avecAscenseur,
      'telephone_client': telephoneClient,
      'mail_client': mailClient,
      'notes_livraison': notesLivraison,
      'camion_livraison': camionLivraison,
      'date_livraison': dateLivraison.toIso8601String(),
      'id_statut_livraison': statutLivraisonId,
      'id_fiche_tracabilite_reemploi': ficheTracabiliteReemploiId,
    };
  }
}
