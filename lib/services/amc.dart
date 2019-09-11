import 'package:myapp/model/amc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AMCService {
  static Future<List<AMC>> getAMCList() async {
    final response = await http.get('http://176.9.137.77:8342/api/amc/?format=json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List amcs = json.decode(response.body);
      return amcs.map( (ele) => new AMC.fromJson(ele)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}