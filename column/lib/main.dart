import 'package:flutter/material.dart';

// Colors
const appBarColor = Color(0xFFFD5D5D);
const columnA = Color(0xFFC0EDA6);
const columnB = Color(0xFFFFF7BC);
const columnC = Color(0xFFFF8080);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Column class',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: appBarColor)
      ),
      home: const MyHomePage(title: 'Column Class Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
