class DonateurClient {
  final int Id;
  final String Nom;
  final String? Prenom;
  final String Adresse;
  final String CodePostal;
  final String Ville;
  final String? Residence;
  final String? Batiment;
  final int Etage;
  final bool AvecAscenseur;
  final String? Telephone;
  final String? Mail;

  DonateurClient({
    required this.Id,
    required this.Nom,
    this.Prenom,
    required this.Adresse,
    required this.CodePostal,
    required this.Ville,
    this.Residence,
    this.Batiment,
    required this.Etage,
    required this.AvecAscenseur,
    this.Telephone,
    this.Mail,
  });
}
