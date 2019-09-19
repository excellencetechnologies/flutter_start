import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/logs.dart';
import 'package:redux/redux.dart';
import 'package:intl/intl.dart';


var formatter = new DateFormat('yyyy-MM-dd');

class LogsViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          store.dispatch(FetchCritialLogsAction());
        },
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          // print(vm.fetchNameMismatchList());
          return ListView.builder(
              itemCount: vm.list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {},
                    title: Text("${vm.list[index].message}"),
                    subtitle: Text("${formatter.format(vm.list[index].time)}"),
                  ),
                );
              });
        });
  }
}

class _ViewModel {
  final Function fetchCritialLogs;
  final List<LogModel> list;
  final Function(String) deleteLog;

  _ViewModel(
      {@required this.fetchCritialLogs,
      @required this.list,
      @required this.deleteLog});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        fetchCritialLogs: () {
          store.dispatch(FetchCritialLogsAction());
        },
        deleteLog: (String logId) {
          store.dispatch(DeleteLogAction(logId));
        },
        list: store.state.logView.logs);
  }
}
