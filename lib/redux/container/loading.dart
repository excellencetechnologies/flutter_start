import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/app_state.dart';

class APILoaderContainer extends StatelessWidget {
  final Widget child;
  APILoaderContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        converter: (store) => store.state.isGlobalAPILoading,
        builder: (context, bool isLoading) {
          return isLoading ? Center(
            child: CircularProgressIndicator(),
          ) : this.child;
        });
  }
}
