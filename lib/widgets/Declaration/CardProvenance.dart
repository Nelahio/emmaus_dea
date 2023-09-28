import 'package:emmaus_dea/class/helper.dart';
import 'package:emmaus_dea/models/Provenance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/FicheTracabilite.dart';
import '../../pages/page_fiches.dart';

class CardProvenance extends StatefulWidget {
  final Provenance provenance;

  const CardProvenance({Key? key, required this.provenance}) : super(key: key);

  @override
  State<CardProvenance> createState() => _CardProvenanceState();
}

class _CardProvenanceState extends State<CardProvenance> {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    super.initState();
  }

  Widget buildSubtitle(List<FicheTracabilite>? fiches) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fiches != null && fiches.isNotEmpty)
          Text("${fiches.length} fiche(s)")
        else
          Text("Aucune fiche"),
        if (fiches != null &&
            fiches.isNotEmpty &&
            fiches.last.DateFiche != null)
          Text("Dernière fiche le ${dateFormat.format(fiches.last.DateFiche)}")
        else
          Text("Date de la dernière fiche inconnue"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FicheTracabiliteModel>(
      builder: (context, ficheModel, child) {
        final fiches = ficheModel.fichesMap[widget.provenance.Id];
        final provenanceInfo = getProvenanceInfo(widget.provenance);

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
                  provenanceInfo.icon,
                  VerticalDivider(
                    color: provenanceInfo.color,
                    width: 25,
                    thickness: 5,
                  ),
                ],
              ),
              title: Text(widget.provenance.Nom),
              subtitle: buildSubtitle(fiches),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageFiches(
                      provenance: widget.provenance.Nom,
                      fiches: fiches ?? [],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
