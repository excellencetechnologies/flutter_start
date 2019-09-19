import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/services/logs.dart';
import 'package:myapp/services/name_mismatch.dart';

class GlobalLoading {
  bool show;
  GlobalLoading({this.show = false});
}

class GlobalError {
  Exception e;
  GlobalError(this.e);
}

class FetchAMCList {}

class FetchAMCListSucess {
  final List<AMC> amcs;
  FetchAMCListSucess(this.amcs);
}

// to fetch category/sub cateogyr for amc filter
class FetchAMCFilterCategory {}

class FetchAMCFilterCategorySuccess {
  final List<String> cats;
  FetchAMCFilterCategorySuccess(this.cats);
}

class FetchAMCFilterSubCategory {
  final String cat;
  FetchAMCFilterSubCategory(this.cat);
}

class FetchAMCFilterSubCategorySuccess {
  final List<String> subcats;
  FetchAMCFilterSubCategorySuccess(this.subcats);
}

class FetchAMCFunds {
  final AMC amc;
  FetchAMCFunds(this.amc);
}

class FetchAMCFundsSuccess {
  final List<Fund> funds;
  FetchAMCFundsSuccess(this.funds);
}

class FetchNameMisMatchList {
  FetchNameMisMatchList();
}

class NameMisMatchSuccess {
  final List<FundMisMatchModel> items;
  NameMisMatchSuccess(this.items);
}

class FetchNameMisMatchProbableList {
  final String amc;
  FetchNameMisMatchProbableList(this.amc);
}

class FetchNameMisMatchProbableListSuccess {
  final List<Fund> items;
  FetchNameMisMatchProbableListSuccess(this.items);
}

class FixNameMisMatchAction {
  final FundMisMatchModel model;
  final Fund fund;
  FixNameMisMatchAction(this.model, this.fund);
}

class FixNameMisMatchSucessAction {
  final FundMisMatchModel model;
  final Fund fund;
  FixNameMisMatchSucessAction(this.model, this.fund);
}

class RecalculateMismatchAction{

}


class FetchCritialLogsAction {}

class FetchCritialLogsSuccess {
  final List<LogModel> list;
  FetchCritialLogsSuccess(this.list);
}

class DeleteLogAction {
  final String log_id;
  DeleteLogAction(this.log_id);
}