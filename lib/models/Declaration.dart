class Declaration {
  final String CodeDeclaration;
  final DateTime DateDeclaration;
  final String Trimestre;
  final int Annee;

  Declaration({
    required this.CodeDeclaration,
    required this.DateDeclaration,
    required this.Trimestre,
    required this.Annee,
  });

  factory Declaration.fromJson(Map<String, dynamic> json) {
    return Declaration(
      CodeDeclaration: json['code_declaration'],
      DateDeclaration: DateTime.parse(json['date_declaration']),
      Trimestre: json['trimestre'],
      Annee: json['annee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code_declaration': CodeDeclaration,
      'date_declaration': DateDeclaration.toIso8601String(),
      'trimestre': Trimestre,
      'annee': Annee,
    };
  }
}
