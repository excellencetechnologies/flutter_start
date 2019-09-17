import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/redux/container/amc_list.dart';
import 'package:myapp/redux/container/loading.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/widget/home/amc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(FetchAMCList());
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: APILoaderContainer(AMCWidget()),
      drawer: AppDrawer(),
    );
  }
}
