import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = 'https://90.23.250.225:32768/api';

  static Future<List<dynamic>?> getEmployees() async {
    // RESPONSE JSON :
    // [{
    //   "id": "1",
    //   "employee_name": "",
    //   "employee_salary": "0",
    //   "employee_age": "0",
    //   "profile_image": ""
    // }]
    final response = await http.get(Uri(path: "${BASE_URL}/FicheTracabilite"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}
