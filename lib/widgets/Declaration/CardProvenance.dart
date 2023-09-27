import 'package:emmaus_dea/class/api/FicheTracabiliteService.dart';
import 'package:emmaus_dea/class/colors_app.dart';
import 'package:emmaus_dea/models/Provenance.dart';
import 'package:emmaus_dea/pages/page_fiches.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/FicheTracabilite.dart';

class CardProvenance extends StatefulWidget {
  final Provenance provenance;

  const CardProvenance({Key? key, required this.provenance}) : super(key: key);

  @override
  State<CardProvenance> createState() => _CardProvenanceState();
}

Color getColor(Provenance provenance) {
  if (provenance.Nom == "Apport volontaire") {
    return ColorsApp.Apport_Color;
  } else if (provenance.Nom == "Collecte à domicile") {
    return ColorsApp.Collecte_Color;
  } else if (provenance.Nom == "Réemploi") {
    return ColorsApp.Reemploi_Color;
  } else {
    return ColorsApp.Blue_Color;
  }
}

Icon getIcon(Provenance provenance) {
  if (provenance.Nom == "Apport volontaire") {
    return Icon(Icons.directions_car_rounded);
  } else if (provenance.Nom == "Collecte à domicile") {
    return Icon(Icons.local_shipping_rounded);
  } else if (provenance.Nom == "Réemploi") {
    return Icon(Icons.attach_money_rounded);
  } else {
    return Icon(Icons.card_travel_rounded);
  }
}

class _CardProvenanceState extends State<CardProvenance> {
  List<FicheTracabilite>? fiches;
  DateTime? lastFicheDate;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    super.initState();
    fetchFichesTracabilite();
  }

  Future<void> fetchFichesTracabilite() async {
    try {
      final listeFiches =
          await FicheTracabiliteService.getFichesTracabiliteByProvenance(
              widget.provenance.Id);
      setState(() {
        fiches = listeFiches;
        if (fiches != null && fiches!.isNotEmpty) {
          lastFicheDate = fiches!.last.DateFiche;
        }
      });
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erreur lors du chargement des fiches : $error"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(12),
        child: ListTile(
          isThreeLine: true,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              getIcon(widget.provenance),
              VerticalDivider(
                color: getColor(widget.provenance),
                width: 25,
                thickness: 5,
              ),
            ],
          ),
          title: Text(widget.provenance.Nom),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fiches != null && fiches!.isNotEmpty)
                Text("${fiches!.length} fiche(s)")
              else
                Text("Aucune fiche"),
              if (lastFicheDate != null)
                Text("Dernière fiche le ${dateFormat.format(lastFicheDate!)}")
              else
                Text("Date de la dernière fiche inconnue"),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageFiches(
                    provenance: widget.provenance.Nom, fiches: fiches!
                    // .sort((a, b) => a.DateFiche.compareTo(b.DateFiche)),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
