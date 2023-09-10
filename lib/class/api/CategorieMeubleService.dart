import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/CategorieMeuble.dart';

class CategorieMeubleService {
  static const String BASE_URL = 'http://62.35.20.56:5126/CategorieMeuble';

  static Future<List<CategorieMeuble>?> getCategoriesMeuble() async {
    final response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = json.decode(responseBody);
      final List<CategorieMeuble> categoriesMeuble =
          jsonList.map((data) => CategorieMeuble.fromJson(data)).toList();
      return categoriesMeuble;
    } else {
      throw Exception('Échec lors du chargement des données');
    }
  }
}
