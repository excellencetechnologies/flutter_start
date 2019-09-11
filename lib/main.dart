import 'package:flutter/material.dart';
import 'package:myapp/screens/home.dart';

void main() => runApp(MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData.light(),
      initialRoute: "/",
      routes: {
        '/': (context) => HomeScreen()
      }
    ));
