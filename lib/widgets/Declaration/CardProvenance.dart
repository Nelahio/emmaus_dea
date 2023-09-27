import 'package:emmaus_dea/class/colors_app.dart';
import 'package:emmaus_dea/models/Provenance.dart';
import 'package:emmaus_dea/pages/page_fiches.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/FicheTracabilite.dart';

class CardProvenance extends StatefulWidget {
  final Provenance provenance;
  final List<FicheTracabilite>? fiches;

  const CardProvenance(
      {Key? key, required this.provenance, required this.fiches})
      : super(key: key);

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
  DateTime? lastFicheDate;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    super.initState();
    fetchLastFicheDate();
    print(lastFicheDate);
  }

  Future<void> fetchLastFicheDate() async {
    if (widget.fiches != null && widget.fiches!.isNotEmpty) {
      final lastDate = widget.fiches!.last.DateFiche;
      setState(() {
        lastFicheDate = lastDate;
      });
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
              if (widget.fiches != null && widget.fiches!.isNotEmpty)
                Text("${widget.fiches!.length} fiche(s)")
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
                    provenance: widget.provenance.Nom, fiches: widget.fiches!
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
