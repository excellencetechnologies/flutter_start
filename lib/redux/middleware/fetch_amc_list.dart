import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/amc.dart';
import 'package:redux/redux.dart';

class ApiCallMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is FetchAMCFilterCategory) {
      () async {
        try {
          List<String> cats = await AMCService.getFundCategoryFilter();
          store.dispatch(FetchAMCFilterCategorySuccess(cats));
          print("fetched cats $cats");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchAMCFilterSubCategory) {
      () async {
        try {
          List<String> cats =
              await AMCService.getFundSubCategoryFilter(action.cat);
          store.dispatch(FetchAMCFilterSubCategorySuccess(cats));
          print("fetched sub cats $cats");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchAMCFunds) {
      () async {
        try {
          store.dispatch(GlobalLoading(show: true));
          List<Fund> funds = await AMCService.getFunds(action.amc);
          store.dispatch(GlobalLoading(show: false));
          store.dispatch(FetchAMCFundsSuccess(funds));
          print("fetched amc funds $funds");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchAMCList) {
      () async {
        try {
          store.dispatch(GlobalLoading(show: true));
          List<AMC> amcs = await AMCService.getAMCList();
          store.dispatch(GlobalLoading(show: false));
          print("fetched amcs $amcs");
          store.dispatch(FetchAMCListSucess(amcs));
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }
    next(action); // very important :)
  }
}
