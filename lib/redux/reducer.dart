import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/redux/reducer/amc_view_state.dart';
import 'package:myapp/redux/reducer/name_mismatch.dart';

bool globalLoadingReducer(bool state, action) {
  if (action is GlobalLoading) {
    return action.show;
  }
  return state;
}
Exception globalExceptionReducer(Exception state, action){
  if (action is GlobalError){
    return action.e;
  }
  return state;
}

AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    globalError: globalExceptionReducer(state.globalError, action),
    amcViewState: amcViewReducer(state.amcViewState, action),
    isGlobalAPILoading: globalLoadingReducer(state.isGlobalAPILoading, action),
    nameMisMatch: nameMismatchReducer(state.nameMisMatch, action)
  );
}
