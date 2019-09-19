import 'package:myapp/model/amc.dart';

class Fund {
  final int id;
  final String name;
  final String schemeType;
  final String schemeSubType;
  final String fundCode;
  final String fundName;
  final String fundOption;
  final String fundType;
  final String line;
  AMC amc;

  Fund.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["clean_name"],
        schemeType = json["scheme_type"],
        schemeSubType = json["scheme_sub_type"],
        fundCode = json["fund_code"],
        fundName = json["fund_name"],
        fundOption = json["fund_option"],
        fundType = json["fund_type"],
        line = json["line"];

  @override
  String toString() {
    return "FUND: $name";
  }
}
