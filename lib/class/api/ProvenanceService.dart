import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/Provenance.dart';

class ProvenanceService {
  static const String BASE_URL = 'http://62.35.20.56:5126/Provenance';

  static Future<List<Provenance>?> getProvenances() async {
    final response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = json.decode(responseBody);
      final List<Provenance> provenances =
          jsonList.map((data) => Provenance.fromJson(data)).toList();
      return provenances;
    } else {
      throw Exception('Échec lors du chargement des données');
    }
  }
}
