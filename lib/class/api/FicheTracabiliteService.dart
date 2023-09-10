import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/FicheTracabilite.dart';

class FicheTracabiliteService {
  static const String BASE_URL = 'http://62.35.20.56:5126/FicheTracabilite';

  static Future<List<FicheTracabilite>?> getFichesTracabiliteByProvenance(
      int idProvenance) async {
    final response =
        await http.get(Uri.parse("$BASE_URL/provenance/$idProvenance"));
    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = json.decode(responseBody);
      final List<FicheTracabilite> fichesTracabilite =
          jsonList.map((data) => FicheTracabilite.fromJson(data)).toList();
      return fichesTracabilite;
    } else {
      throw Exception('Échec lors du chargement des données');
    }
  }
}
