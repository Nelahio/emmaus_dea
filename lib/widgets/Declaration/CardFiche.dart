import 'package:emmaus_dea/class/colors_app.dart';
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

  Color getColor() {
    if (provenance == "Apport volontaire") {
      return ColorsApp.Apport_Color;
    } else if (provenance == "Collecte à domicile") {
      return ColorsApp.Collecte_Color;
    } else if (provenance == "Réemploi") {
      return ColorsApp.Reemploi_Color;
    } else {
      return Colors.blue; // Couleur par défaut
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300), // Largeur maximale souhaitée
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: getColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Center(
                child: Text(
                  provenance,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        dateFormat.format(ficheTracabilite.DateFiche!),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${ficheTracabilite.TracerFicheMeubles.length} meuble(s)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.equalizer,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "300 kg",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
