import 'package:myapp/model/amc.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:redux/redux.dart';

List<AMC> fetchAMCSuccess(List<AMC> state, FetchAMCListSucess action) {
  return new List.from(action.amcs);
}

//https://github.com/johnpryan/redux.dart/blob/master/doc/combine_reducers.md
final Reducer<List<AMC>> amcItemsReducer = combineReducers<List<AMC>>(
    [new TypedReducer<List<AMC>, FetchAMCListSucess>(fetchAMCSuccess)]);

List<String> amcFilterCategoryReducer(List<String> filterCats, dynamic action) {
  if (action is FetchAMCFilterCategorySuccess) {
    return new List.from(action.cats);
  }
  return filterCats;
}

List<String> amcFilterSubCategoryReducer(
    List<String> filteSubCats, dynamic action) {
  if (action is FetchAMCFilterSubCategorySuccess) {
    return new List.from(action.subcats);
  }
  return filteSubCats;
}

List<Fund> amcFundsReducer(List<Fund> funds, dynamic action) {
  if (action is FetchAMCFundsSuccess) {
    return new List.from(action.funds);
  }
  return funds;
}

AMCViewState amcViewReducer(AMCViewState state, dynamic action) {
  return AMCViewState(
      amcList: amcItemsReducer(state.amcList, action),
      filterCats: amcFilterCategoryReducer(state.filterCats, action),
      filterSubCats: amcFilterSubCategoryReducer(state.filterSubCats, action),
      funds: amcFundsReducer(state.funds, action));
}
