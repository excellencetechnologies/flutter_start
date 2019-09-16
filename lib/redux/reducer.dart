import 'package:myapp/model/amc.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:redux/redux.dart';

List<AMC> fetchAMCSuccess(List<AMC> state, FetchAMCListSucess action) {
  return new List.from(action.amcs);
}

//https://github.com/johnpryan/redux.dart/blob/master/doc/combine_reducers.md
final Reducer<List<AMC>> amcItemsReducer = combineReducers<List<AMC>>(
    [new TypedReducer<List<AMC>, FetchAMCListSucess>(fetchAMCSuccess)]);

bool globalLoadingReducer(bool state, action) {
  if (action is GlobalLoading) {
    return action.show;
  }
  return state;
}

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
      amcList: amcItemsReducer(state.amcList, action),
      isGlobalAPILoading:
          globalLoadingReducer(state.isGlobalAPILoading, action));
}
