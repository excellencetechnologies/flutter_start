import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/logs.dart';

List<LogModel> logItemsViewReducer(List<LogModel> items, dynamic action) {
  if (action is FetchCritialLogsSuccess) {
    return new List.from(action.list);
  }
  return items;
}

LogViewState logViewReducer(LogViewState state, dynamic action) {
  return LogViewState(logs: logItemsViewReducer(state.logs, action));
}
