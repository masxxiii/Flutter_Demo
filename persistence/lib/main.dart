import 'package:flutter/material.dart';
import 'package:states/screens/main_screen_provider.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: MainScreenProvider()
      ),
    ),
  );
}
