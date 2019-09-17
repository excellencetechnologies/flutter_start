import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';

class AMCViewState {
  List<AMC> amcList;
  List<String> filterCats;
  List<String> filterSubCats;
  List<Fund> funds;

  AMCViewState({this.amcList, this.filterCats, this.filterSubCats, this.funds});

  static var empty =
      AMCViewState(amcList: [], filterCats: [], filterSubCats: [], funds: []);
}

class AppState {
  bool isGlobalAPILoading = false;
  final AMCViewState amcViewState;

  AppState({this.isGlobalAPILoading, this.amcViewState});

  static var empty =
      AppState(isGlobalAPILoading: false, amcViewState: AMCViewState.empty);
}
