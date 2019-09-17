import 'package:flutter/material.dart';
import 'package:myapp/redux/container/amc_list.dart';
import 'package:myapp/widget/drawer.dart';

class AMCListScreen extends StatelessWidget {
  static final String routeName = "/amcList";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text("AMC List"),
      ),
      body: AMCListContainer(),
      drawer: AppDrawer(),
    );
  }
}
