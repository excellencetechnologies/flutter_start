import 'package:http/http.dart' as http;
import 'package:myapp/model/fund.dart';
import 'dart:convert';

import 'package:myapp/services/index.dart';

//  url(r'^', NameMismatchList.as_view()),
//   url(r'^get_probable_list_for_mismatch/(?P<amc>[\w|\W]+)/$',
//       get_probable_list_for_mismatch),
//   url(r'^fix_name_mismatch/(?P<mismatch_id>\d+)/(?P<scheme_id>\d+)/$', fix_name_mismatch)

class FundMisMatchModel {
  final int id;
  final String amc;
  final String category;
  final String subcategory;
  final String name;
  final String inception;
  final String aum;
  FundMisMatchModel(this.id, this.amc, this.category, this.subcategory,
      this.name, this.inception, this.aum);

  FundMisMatchModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        amc = json["amc"],
        category = json["category"],
        subcategory = json["subcategory"],
        name = json["name"],
        inception = json["inception"],
        aum = json["aum"];

  @override
  String toString() {
    return "ID $id  AMC $amc FUND: $name";
  }
}

class FundNameMismatchService {
  static Future<bool> recalculate_mismatch() async {
    final response =
        await http.get('$API_URL/api/recalculate_mismatch/?format=json');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return true;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<bool> fix(FundMisMatchModel mismatch, Fund fund) async {
    final response = await http.get(
        '$API_URL/api/fix_name_mismatch/${mismatch.id}/${fund.id}?format=json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return true;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<FundMisMatchModel>> getNameMisMatchList() async {
    final response =
        await http.get('$API_URL/api/get_name_mismatch/?format=json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List amcs = json.decode(response.body);
      return amcs.map((ele) => new FundMisMatchModel.fromJson(ele)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Fund>> getProbableListForMismatch(String amc) async {
    final response = await http
        .get('$API_URL/api/get_probable_list_for_mismatch/$amc/?format=json');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      List amcs = json.decode(response.body);
      return amcs.map((ele) => new Fund.fromJson(ele)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
