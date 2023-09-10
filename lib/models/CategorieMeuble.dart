class CategorieMeuble {
  final int Id;
  final String Nom;

  const CategorieMeuble({
    required this.Id,
    required this.Nom,
  });

  factory CategorieMeuble.fromJson(Map<String, dynamic> json) {
    return CategorieMeuble(
      Id: json['Id'],
      Nom: json['Nom'],
    );
  }
}
