import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/model/fund.dart';
import 'package:myapp/model/amc.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/widget/amc_detail/index.dart';
import 'package:redux/redux.dart';

class AMCDetailContainer extends StatelessWidget {
  final AMC amc;

  AMCDetailContainer(this.amc);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      onInit: (store) {
        store.dispatch(FetchAMCFunds(this.amc));
        store.dispatch(FetchAMCFilterCategory());
      },
      converter: (store) => _ViewModel.fromStore(store, this.amc),
      builder: (context, vm) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: FundFilterType(
                    categoryList: vm.cats,
                    subCategoryList: vm.subcats,
                    onChangeCategoryFilter: vm.fetchSubCategoryList,
                  ),
                ),
                Text(
                  "Funds",
                  style: Theme.of(context).textTheme.title,
                ),
                Expanded(
                  flex: 8,
                  child: AMCFetchFund(
                    amc: this.amc,
                    funds: vm.funds,
                  ),
                )
              ],
            ));
      },
    );
  }
}

class _ViewModel {
  final Function fetchFundList;
  final Function fetchCategoryList;
  final Function(String) fetchSubCategoryList;
  final List<String> cats;
  final List<String> subcats;
  final List<Fund> funds;

  _ViewModel(
      {@required this.fetchFundList,
      @required this.fetchCategoryList,
      @required this.fetchSubCategoryList,
      @required this.funds,
      @required this.subcats,
      @required this.cats});

  static _ViewModel fromStore(Store<AppState> store, AMC amc) {
    return _ViewModel(
        fetchFundList: () {
          store.dispatch(FetchAMCFunds(amc));
        },
        fetchCategoryList: () {
          store.dispatch(FetchAMCFilterCategory());
        },
        fetchSubCategoryList: (String selectedCat) {
          store.dispatch(FetchAMCFilterSubCategory(selectedCat));
        },
        cats: store.state.amcViewState.filterCats,
        subcats: store.state.amcViewState.filterSubCats,
        funds: store.state.amcViewState.funds);
  }
}
