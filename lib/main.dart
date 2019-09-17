import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/middleware/fetch_amc_list.dart';
import 'package:myapp/screens/amc.dart';
import 'package:myapp/screens/amc_list.dart';
import 'package:myapp/screens/home.dart';
import 'package:redux/redux.dart';
import 'package:myapp/redux/reducer.dart';
import 'package:myapp/redux/app_state.dart';
import 'package:redux_logging/redux_logging.dart';

//this is a single class or can b

void main() {
  final store = new Store<AppState>(appStateReducer,
      initialState: AppState.empty,
      middleware: [new LoggingMiddleware.printer(), new ApiCallMiddleware()]);
  runApp(MainApp(store));
}

class MainApp extends StatelessWidget {
  final Store<AppState> store;
  MainApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: 'My First Flutter Redux App',
            initialRoute: "/",
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              AMCListScreen.routeName: (context) => AMCListScreen()
            },
            theme: ThemeData.light()));
  }
}
