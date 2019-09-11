import 'package:flutter/material.dart';
import 'package:myapp/widget/drawer.dart';
import 'package:myapp/model/amc.dart';

class AMCScreen extends StatelessWidget {
  final String routeName = "/amcScreen";
  final AMC amc;
  AMCScreen({Key key, @required this.amc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
        title: Text(amc.name),
      ),
      body: Center(
        child: Text(amc.name),
      )  ,
      drawer: AppDrawer(),
    );
  }
}
