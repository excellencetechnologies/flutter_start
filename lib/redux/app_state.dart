import 'package:myapp/model/amc.dart';

class AppState {
  bool isGlobalAPILoading = false;
  List<AMC> amcList;

  AppState({this.isGlobalAPILoading, this.amcList});

  static var empty = AppState(isGlobalAPILoading: false, amcList: []);
}
