class Declaration {
  final String codeDeclaration;
  final DateTime dateDeclaration;
  final String trimestre;
  final int annee;

  Declaration({
    required this.codeDeclaration,
    required this.dateDeclaration,
    required this.trimestre,
    required this.annee,
  });

  factory Declaration.fromJson(Map<String, dynamic> json) {
    return Declaration(
      codeDeclaration: json['code_declaration'],
      dateDeclaration: DateTime.parse(json['date_declaration']),
      trimestre: json['trimestre'],
      annee: json['annee'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code_declaration': codeDeclaration,
      'date_declaration': dateDeclaration.toIso8601String(),
      'trimestre': trimestre,
      'annee': annee,
    };
  }
}
