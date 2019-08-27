import 'package:flutter/material.dart';
import 'package:abc_app/main_screen.dart';

void main() => runApp(ABCApp());

class ABCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
