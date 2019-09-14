import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

//this is a single class or can be a string. mainly just to identify action
class IncrementAction {
  IncrementAction();
}

// this is a reduce which changes the state depending on action
int reducer(int state, dynamic action) {
  if (action is IncrementAction) {
    state = state + 1;
  }
  return state;
}

int appState = 0;

void main() {
  final store = new Store<int>(reducer, initialState: appState);
  runApp(MainApp(store));
}

class MainApp extends StatelessWidget {
  final Store<int> store;
  MainApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
          title: 'My First Flutter Redux App',
          theme: ThemeData.light(),
          home: Scaffold(
              appBar: AppBar(
                title: Text('Redux Counter'),
              ),
              body: Center(
                child: TestDisplayWidget(),
              ),
              floatingActionButton: TestActionWidget()
        )
      )
    );
  }
}

class TestDisplayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<int, String>(
        converter: (store) => store.state.toString(),
        builder: (context, counter) {
          return Text("Counter value $counter");
        });
  }
}

class TestActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<int, VoidCallback>(converter: (store) {
      return () => store.dispatch(IncrementAction());
    }, builder: (context, callback) {
      return FloatingActionButton(child: Icon(Icons.plus_one), onPressed: callback);
    });
  }
}

