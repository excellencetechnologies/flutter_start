import 'package:myapp/model/amc.dart';

class FetchAMCList {}

class GlobalLoading {
  bool show;
  GlobalLoading({this.show = false});
}

class FetchAMCListSucess {
  final List<AMC> amcs;
  FetchAMCListSucess(this.amcs);
}

class FetchAMCListError {
  final String error;
  FetchAMCListError(this.error);
}
