import 'package:emmaus_dea/class/helper.dart';
import 'package:emmaus_dea/models/FicheTracabilite.dart';
import 'package:emmaus_dea/widgets/Declaration/CardFiche.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/HomeAppBar.dart';

class PageFicheDetails extends StatelessWidget {
  final FicheTracabilite fiche;
  final String provenance;
  final CalculatedInfo infos;

  const PageFicheDetails({
    Key? key,
    required this.fiche,
    required this.provenance,
    required this.infos,
  }) : super(key: key);

  Color getColor() {
    switch (provenance) {
      case "Apport volontaire":
        return ColorsApp.Apport_Color;
      case "Collecte à domicile":
        return ColorsApp.Collecte_Color;
      case "Réemploi":
        return ColorsApp.Reemploi_Color;
      default:
        return Colors.blue;
    }
  }

  Widget buildProvenanceCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: getColor(),
          width: 2,
        ),
      ),
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${provenance}",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Fiche n°${fiche.Id} en date du ${DateFormat("EEEE dd/MM/yyyy", "fr_FR").format(fiche.DateFiche)}",
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMeublesCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: getColor(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: fiche.TracerFicheMeubles.map((item) {
                    return Row(
                      children: [
                        SizedBox(
                          width: 10, // Espacement entre les éléments
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              item.meuble.Nom,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10, // Espacement entre le nom et la quantité
                        ),
                        Text(
                          "x ${item.quantite}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
            height: 0,
          ),
          Expanded(
            child: Center(
              child: Text(
                "${infos.nombreMeubles} meubles",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPoidsCard() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: getColor(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "${infos.poidsTotal} kg",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(width: 2),
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: getColor(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "${infos.poidsTotal / 1000} t",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRamasseAssocieeCard() {
    if (provenance == "Collecte à domicile") {
      return Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: getColor(),
              width: 2,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                  child: Text(
                'Ramasse n°${fiche.RamasseId} associée',
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
            ),
          ),
        ),
      );
    } else {
      return SizedBox.shrink(); // Retourne un widget vide pour masquer la carte
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildProvenanceCard(),
          IntrinsicHeight(
            child: buildMeublesCard(),
          ),
          SizedBox(height: 2),
          buildPoidsCard(),
          buildRamasseAssocieeCard(),
        ],
      ),
    );
  }
}
