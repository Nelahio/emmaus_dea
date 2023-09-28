import 'package:flutter/material.dart';

import '../models/Provenance.dart';

class ColorsApp {
  static const Blue_Color = Color(0xFF084183);
  static const Yellow_Color = Color(0xFFFFF04F);
  static const Apport_Color = Color(0xFF992058);
  static const Collecte_Color = Color(0xFF0086BF);
  static const Reemploi_Color = Color(0xFFE6900A);
}

class ProvenanceInfo {
  final Color color;
  final Icon icon;

  ProvenanceInfo(this.color, this.icon);
}

ProvenanceInfo getProvenanceInfo(Provenance provenance) {
  switch (provenance.Nom) {
    case "Apport volontaire":
      return ProvenanceInfo(
          ColorsApp.Apport_Color, Icon(Icons.directions_car_rounded));
    case "Collecte à domicile":
      return ProvenanceInfo(
          ColorsApp.Collecte_Color, Icon(Icons.local_shipping_rounded));
    case "Réemploi":
      return ProvenanceInfo(
          ColorsApp.Reemploi_Color, Icon(Icons.attach_money_rounded));
    default:
      return ProvenanceInfo(
          ColorsApp.Blue_Color, Icon(Icons.card_travel_rounded));
  }
}
