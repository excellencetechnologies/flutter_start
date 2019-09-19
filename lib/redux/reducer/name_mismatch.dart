import 'package:myapp/model/fund.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/name_mismatch.dart';

List<FundMisMatchModel> mismatchListReducer(
    List<FundMisMatchModel> funds, dynamic action) {
  if (action is NameMisMatchSuccess) {
    return new List.from(action.items);
  } else if (action is FixNameMisMatchSucessAction) {
    return List.from(funds)..remove(action.model);
  }
  return funds;
}

List<Fund> fundListReducer(List<Fund> funds, dynamic action) {
  if (action is NameMisMatchSuccess) {
    return new List();
  } else if (action is FetchNameMisMatchProbableListSuccess) {
    return new List.from(action.items);
  }
  return funds;
}

NameMisMatchState nameMismatchReducer(NameMisMatchState state, dynamic action) {
  return NameMisMatchState(
      items: mismatchListReducer(state.items, action),
      fundList: fundListReducer(state.fundList, action));
}
