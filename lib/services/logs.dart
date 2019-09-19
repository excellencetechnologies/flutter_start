import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/services/index.dart';

class LogModel {
  final String id;
  final String type;
  final String message;
  final DateTime time;

  LogModel(this.id, this.type, this.message, this.time);

  LogModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        type = json["type"],
        message = json["message"],
        time = new DateTime.fromMillisecondsSinceEpoch(json["time"]);

  @override
  String toString() {
    return "ID $id";
  }
}

class LogService {
  static Future<List<LogModel>> getCriticalLogs() async {
    final response =
        await http.get('$API_URL/api/get_critical_logs/?format=json');

    if (response.statusCode == 200) {
      print(response.body);
      List amcs = json.decode(response.body);
      return amcs.map((ele) => new LogModel.fromJson(ele)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<bool> deleteLog(String log_id) async {
    final response =
        await http.get('$API_URL/api/delete_log/${log_id}?format=json');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
