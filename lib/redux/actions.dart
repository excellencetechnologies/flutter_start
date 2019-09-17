import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';

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
