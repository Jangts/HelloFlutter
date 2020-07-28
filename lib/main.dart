import 'package:flutter/material.dart';
import 'package:hello_world/views/pages/HomePage/main.dart';
import 'package:hello_world/views/pages/ReadingPage/main.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Home Page'),
      routes: <String, WidgetBuilder>{
        'router/reading': (_) => new ReadingPage(title: 'Reading Page')
      }
    );
  }
}