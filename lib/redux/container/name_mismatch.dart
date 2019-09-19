import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/services/name_mismatch.dart';
import 'package:redux/redux.dart';

class NameMisMatchContainer extends StatelessWidget {
  List<Fund> funds = [];
  int misMatchSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          store.dispatch(FetchNameMisMatchList());
        },
        onDidChange: (vm) {
          print(vm.probableList);
          if (vm.probableList.length > 0 && vm.probableList != funds) {
            funds = vm.probableList;
            showModalBottomSheet(
                useRootNavigator: true,
                context: context,
                builder: (context) => Container(
                    constraints: BoxConstraints(maxHeight: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                            child: ListTile(
                          title: Text(
                            "Probable Funds for ",
                            style: Theme.of(context).textTheme.title,
                          ),
                          subtitle: Text(
                              "${vm.list[misMatchSelectedIndex].name}",
                              style: Theme.of(context).textTheme.subtitle),
                          trailing: IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )),
                        Expanded(
                          child: ListView.builder(
                              itemCount: vm.probableList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    child: ListTile(
                                  title: Text(vm.probableList[index].fundName),
                                  isThreeLine: true,
                                  subtitle: Text(
                                      "${vm.probableList[index].schemeType}  ${vm.probableList[index].schemeSubType} ${vm.probableList[index].line}"),
                                  trailing: IconButton(
                                    icon: Icon(Icons.play_arrow),
                                    onPressed: () {
                                      vm.fix( vm.list[misMatchSelectedIndex] , vm.probableList[index] );
                                      Navigator.of(context).pop();
                                      vm.doEmptyProbableList();
                                    },
                                  ),
                                ));
                              }),
                        )
                      ],
                    )));
          }
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
                    onTap: () {
                      misMatchSelectedIndex = index;
                      vm.fetchProbableList(vm.list[index].amc);
                    },
                    leading: Icon(Icons.donut_small),
                    subtitle: Text(
                        "${vm.list[index].amc} , ${vm.list[index].category}, ${vm.list[index].subcategory} , ${vm.list[index].aum}cr   "),
                    title: Text('${vm.list[index].name}'),
                  ),
                );
              });
        });
  }
}

class _ViewModel {
  final Function fetchNameMismatchList;
  final Function(String) fetchProbableList;
  final List<FundMisMatchModel> list;
  final List<Fund> probableList;
  final Function(FundMisMatchModel, Fund) fix;
  final Function doEmptyProbableList;

  _ViewModel(
      {@required this.fetchNameMismatchList,
      @required this.list,
      @required this.fetchProbableList,
      @required this.probableList,
      @required this.fix,
      @required this.doEmptyProbableList});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        fetchProbableList: (amc) {
          store.dispatch((FetchNameMisMatchProbableList(amc)));
        },
        doEmptyProbableList: (){
          store.dispatch(FetchNameMisMatchProbableListSuccess([]));
        },
        list: store.state.nameMisMatch.items,
        probableList: store.state.nameMisMatch.fundList,
        fetchNameMismatchList: () {
          store.dispatch(FetchNameMisMatchList());
        },
        fix: (FundMisMatchModel model, Fund fund) {
          store.dispatch(FixNameMisMatchAction(model, fund));
        });
  }
}
