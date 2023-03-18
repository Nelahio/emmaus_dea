import 'package:emmaus_dea/class/colors_app.dart';
import 'package:emmaus_dea/widgets/Declaration/CardDeclaration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class PageDeclaration extends StatefulWidget {
  const PageDeclaration({Key? key}) : super(key: key);

  @override
  State<PageDeclaration> createState() => _PageDeclarationState();
}

class _PageDeclarationState extends State<PageDeclaration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return CardDeclaration();
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        backgroundColor: ColorsApp.Blue_Color,
        child: Icon(Icons.add),
        type: ExpandableFabType.up,
        distance: 75,
        expandedFabSize: ExpandableFabSize.regular,
        closeButtonStyle: ExpandableFabCloseButtonStyle(
          backgroundColor: ColorsApp.Blue_Color,
        ),
        children: [
          FloatingActionButton.extended(
            backgroundColor: ColorsApp.Blue_Color,
            icon: const Icon(Icons.add_card_rounded),
            label: Text("Fiche"),
            onPressed: () {
              if (kDebugMode) {
                print("Fiche");
              }
            },
          ),
          FloatingActionButton.extended(
            backgroundColor: ColorsApp.Blue_Color,
            icon: const Icon(Icons.add_chart_rounded),
            onPressed: () {
              if (kDebugMode) {
                print("Déclaration");
              }
            },
            label: Text("Déclaration"),
          ),
        ],
      ),
    );
  }
}
