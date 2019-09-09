import 'package:flutter/material.dart';
import "package:myapp/widget/home/amc.dart";
import 'package:myapp/widget/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: AMCSummary(),
      drawer: AppDrawer(),
    );
  }
}
