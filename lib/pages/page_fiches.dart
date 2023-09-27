import 'package:emmaus_dea/widgets/Declaration/CardFiche.dart';
import 'package:emmaus_dea/widgets/HomeAppBar.dart';
import 'package:flutter/material.dart';

import '../models/FicheTracabilite.dart';

class PageFiches extends StatefulWidget {
  final String provenance;
  final List<FicheTracabilite>? fiches;
  const PageFiches({Key? key, required this.provenance, required this.fiches})
      : super(key: key);

  @override
  State<PageFiches> createState() => _PageFichesState();
}

class _PageFichesState extends State<PageFiches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CardFiche(
            provenance: widget.provenance,
            ficheTracabilite: widget.fiches![index],
          );
        },
        itemCount: widget.fiches?.length,
      ),
      // floatingActionButton: ExpandableFabDeclaration(),
    );
  }
}
