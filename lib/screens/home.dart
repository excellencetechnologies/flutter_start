import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/actions.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:myapp/redux/container/logs_view.dart';
import 'package:myapp/redux/container/name_mismatch.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/widget/home/amc.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.dashboard)),
                    Tab(icon: Icon(Icons.bug_report)),
                    Tab(icon: Icon(Icons.list)),
                  ],
                ),
                title: Text('Dashboard'),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      final index = DefaultTabController.of(context).index;
                      if (index == 0) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(FetchAMCList());
                      } else if (index == 1) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(FetchNameMisMatchList());
                      } else if (index == 2){
                        StoreProvider.of<AppState>(context)
                            .dispatch(FetchCritialLogsAction());
                      }
                    },
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
              body: TabBarView(
                children: <Widget>[AMCWidget(), NameMisMatchContainer(), LogsViewContainer()],
              ),
              drawer: AppDrawer(),
            );
          },
        ));
  }
}
