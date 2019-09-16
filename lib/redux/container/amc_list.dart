import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/widget/home/amc.dart';
import 'package:redux/redux.dart';

class AMCListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return AMCWidget(vm.amcList);
      },
    );
  }
}

class _ViewModel {
  final Function fetchAMCList;
  final List<AMC> amcList;

  _ViewModel({@required this.amcList, @required this.fetchAMCList});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        amcList: store.state.amcList,
        fetchAMCList: () {
          store.dispatch(FetchAMCList());
        });
  }
}
