import 'package:flutter/material.dart';
import 'package:myapp/widget/drawer.dart';

class AMCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMC'),
      ),
      body: Center(
        child: Text("AMC Page"),
      )  ,
      drawer: AppDrawer(),
    );
  }
}
