class Ramasse {
  final int id;
  final String nomDonateur;
  final String? prenomDonateur;
  final String adresseDonateur;
  final String codePostalDonateur;
  final String villeDonateur;
  final String? residenceDonateur;
  final String? batimentDonateur;
  final String etageDonateur;
  final bool avecAscenseur;
  final String telephoneDonateur;
  final String? mailDonateur;
  final String? notesRamasse;
  final int camionRamasse;
  final DateTime dateRamasse;
  final int trancheHoraireId;
  final int statutRamasseId;

  Ramasse({
    required this.id,
    required this.nomDonateur,
    this.prenomDonateur,
    required this.adresseDonateur,
    required this.codePostalDonateur,
    required this.villeDonateur,
    this.residenceDonateur,
    this.batimentDonateur,
    required this.etageDonateur,
    required this.avecAscenseur,
    required this.telephoneDonateur,
    this.mailDonateur,
    this.notesRamasse,
    required this.camionRamasse,
    required this.dateRamasse,
    required this.trancheHoraireId,
    required this.statutRamasseId,
  });

  factory Ramasse.fromJson(Map<String, dynamic> json) {
    return Ramasse(
      id: json['id'],
      nomDonateur: json['nom_donateur'],
      prenomDonateur: json['prenom_donateur'],
      adresseDonateur: json['adresse_donateur'],
      codePostalDonateur: json['code_postal_donateur'],
      villeDonateur: json['ville_donateur'],
      residenceDonateur: json['residence_donateur'],
      batimentDonateur: json['batiment_donateur'],
      etageDonateur: json['etage_donateur'],
      avecAscenseur: json['avec_ascenseur'],
      telephoneDonateur: json['telephone_donateur'],
      mailDonateur: json['mail_donateur'],
      notesRamasse: json['notes_ramasse'],
      camionRamasse: json['camion_ramasse'],
      dateRamasse: DateTime.parse(json['date_ramasse']),
      trancheHoraireId: json['id_tranche_horaire'],
      statutRamasseId: json['id_statut_ramasse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom_donateur': nomDonateur,
      'prenom_donateur': prenomDonateur,
      'adresse_donateur': adresseDonateur,
      'code_postal_donateur': codePostalDonateur,
      'ville_donateur': villeDonateur,
      'residence_donateur': residenceDonateur,
      'batiment_donateur': batimentDonateur,
      'etage_donateur': etageDonateur,
      'avec_ascenseur': avecAscenseur,
      'telephone_donateur': telephoneDonateur,
      'mail_donateur': mailDonateur,
      'notes_ramasse': notesRamasse,
      'camion_ramasse': camionRamasse,
      'date_ramasse': dateRamasse.toIso8601String(),
      'id_tranche_horaire': trancheHoraireId,
      'id_statut_ramasse': statutRamasseId,
    };
  }
}
