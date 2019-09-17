import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/redux/reducer/amc_view_state.dart';

bool globalLoadingReducer(bool state, action) {
  if (action is GlobalLoading) {
    return action.show;
  }
  return state;
}

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    amcViewState: amcViewReducer(state.amcViewState, action),
    isGlobalAPILoading: globalLoadingReducer(state.isGlobalAPILoading, action),
  );
}
