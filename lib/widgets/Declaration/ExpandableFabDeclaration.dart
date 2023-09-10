import 'package:emmaus_dea/class/colors_app.dart';
import 'package:emmaus_dea/pages/page_nouvelle_fiche.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ExpandableFabDeclaration extends StatefulWidget {
  const ExpandableFabDeclaration({Key? key}) : super(key: key);

  @override
  State<ExpandableFabDeclaration> createState() =>
      _ExpandableFabDeclarationState();
}

class _ExpandableFabDeclarationState extends State<ExpandableFabDeclaration> {
  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      backgroundColor: ColorsApp.Blue_Color,
      child: const Icon(Icons.add),
      type: ExpandableFabType.up,
      distance: 60,
      expandedFabSize: ExpandableFabSize.regular,
      closeButtonStyle: const ExpandableFabCloseButtonStyle(
        backgroundColor: ColorsApp.Blue_Color,
      ),
      children: [
        FloatingActionButton.extended(
          heroTag: const Text("BoutonFiche"),
          backgroundColor: ColorsApp.Blue_Color,
          icon: const Icon(Icons.add_card_rounded),
          label: const Text("Fiche"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PageNouvelleFiche(),
              ),
            );
          },
        ),
        FloatingActionButton.extended(
          heroTag: const Text("BoutonDeclaration"),
          backgroundColor: ColorsApp.Blue_Color,
          icon: const Icon(Icons.add_chart_rounded),
          label: const Text("Déclaration"),
          onPressed: () {},
        ),
      ],
    );
  }
}
