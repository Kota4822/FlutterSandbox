import 'package:flutter/material.dart';
import 'DefaultSample/increment.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IncrementPage(title: 'Flutter Sandbox'),
    );
  }
}
