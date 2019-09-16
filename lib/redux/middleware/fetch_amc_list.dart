import 'package:myapp/model/amc.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/amc.dart';
import 'package:redux/redux.dart';

class FetchAMCListMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is FetchAMCList) {
      () async {
        try {
          store.dispatch(GlobalLoading(show: true));
          List<AMC> amcs = await AMCService.getAMCList();
          store.dispatch(GlobalLoading(show: false));
          print("fetched item $amcs");
          store.dispatch(FetchAMCListSucess(amcs));
        } catch (e) {
          print(e);
          store.dispatch(FetchAMCListError(e.toString()));
        }
      }();
    }
    next(action); // very important :)
  }
}
