import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/amc.dart';
import 'package:myapp/services/logs.dart';
import 'package:myapp/services/name_mismatch.dart';
import 'package:redux/redux.dart';

class ApiCallMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is DeleteLogAction) {
      () async {
        try {
          await LogService.deleteLog(action.log_id);
          store.dispatch(FetchCritialLogsAction());
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchCritialLogsAction) {
      () async {
        try {
          List<LogModel> list = await LogService.getCriticalLogs();
          store.dispatch(FetchCritialLogsSuccess(list));
        } on Exception catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is RecalculateMismatchAction) {
      () async {
        try {
          await FundNameMismatchService.recalculate_mismatch();
          store.dispatch(FetchNameMisMatchList());
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchNameMisMatchProbableList) {
      () async {
        try {
          List<Fund> cats =
              await FundNameMismatchService.getProbableListForMismatch(
                  action.amc);
          store.dispatch(FetchNameMisMatchProbableListSuccess(cats));
          print("fetched probable list $cats");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FixNameMisMatchAction) {
      () async {
        try {
          await FundNameMismatchService.fix(action.model, action.fund);
          store
              .dispatch(FixNameMisMatchSucessAction(action.model, action.fund));
          // print("fetched probable list $cats");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchNameMisMatchList) {
      () async {
        try {
          List<FundMisMatchModel> cats =
              await FundNameMismatchService.getNameMisMatchList();
          store.dispatch(NameMisMatchSuccess(cats));
          // print("fetched name mismatch $cats");
        } catch (e) {
          print(e);
          store.dispatch(GlobalError(e));
        }
      }();
    }

    if (action is FetchAMCFilterCategory) {
      () async {
        try {
          List<String> cats = await AMCService.getFundCategoryFilter();
          store.dispatch(FetchAMCFilterCategorySuccess(cats));
          // print("fetched cats $cats");
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
          // print("fetched sub cats $cats");
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
          // print("fetched amc funds $funds");
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
          // print("fetched amcs $amcs");
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
