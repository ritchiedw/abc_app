import 'package:flutter/material.dart';
import 'package:abc_app/main_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(ABCApp());

class ABCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
