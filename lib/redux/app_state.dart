import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/services/logs.dart';
import 'package:myapp/services/name_mismatch.dart';

class AMCViewState {
  List<AMC> amcList;
  List<String> filterCats;
  List<String> filterSubCats;
  List<Fund> funds;

  AMCViewState({this.amcList, this.filterCats, this.filterSubCats, this.funds});

  static var empty =
      AMCViewState(amcList: [], filterCats: [], filterSubCats: [], funds: []);
}

class NameMisMatchState {
  List<FundMisMatchModel> items;
  List<Fund> fundList;

  NameMisMatchState({this.items, this.fundList});

  static var empty = NameMisMatchState(items: [], fundList: []);
}

class LogViewState {
  List<LogModel> logs;
  LogViewState({this.logs});

  static var empty = LogViewState(logs: []);
}

class AppState {
  bool isGlobalAPILoading = false;
  Exception globalError;
  final AMCViewState amcViewState;
  final NameMisMatchState nameMisMatch;
  final LogViewState logView;

  AppState(
      {this.isGlobalAPILoading,
      this.amcViewState,
      this.nameMisMatch,
      this.globalError,
      this.logView});

  static var empty = AppState(
      globalError: null,
      isGlobalAPILoading: false,
      amcViewState: AMCViewState.empty,
      nameMisMatch: NameMisMatchState.empty,
      logView: LogViewState.empty);
}
