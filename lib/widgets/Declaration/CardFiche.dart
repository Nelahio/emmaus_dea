import 'package:emmaus_dea/class/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/FicheTracabilite.dart';

class CardFiche extends StatelessWidget {
  final String provenance;
  final FicheTracabilite ficheTracabilite;

  CardFiche({
    required this.provenance,
    required this.ficheTracabilite,
  });

  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final DateFormat dayFormat = DateFormat("dd");
  final DateFormat monthFormat = DateFormat("MM");
  final DateFormat yearFormat = DateFormat("yyyy");

  Color getColor() {
    switch (provenance) {
      case "Apport volontaire":
        return ColorsApp.Apport_Color;
      case "Collecte à domicile":
        return ColorsApp.Collecte_Color;
      case "Réemploi":
        return ColorsApp.Reemploi_Color;
      default:
        return Colors.blue; // Couleur par défaut
    }
  }

  Widget buildDateInfo() {
    final DateTime date = ficheTracabilite.DateFiche!;
    final String day = dayFormat.format(date);
    final String month = monthFormat.format(date);
    final String year = yearFormat.format(date);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          month,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          year,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: getColor(),
            width: 3.0,
          ),
        ),
        elevation: 5,
        margin: EdgeInsets.all(12),
        child: ListTile(
          isThreeLine: true,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildDateInfo(),
              VerticalDivider(
                color: getColor(),
                width: 25,
                thickness: 5,
              ),
            ],
          ),
          title: Text(
            provenance,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${ficheTracabilite.TracerFicheMeubles.length} meuble(s)"),
            ],
          ),
        ),
      ),
    );
  }
}
