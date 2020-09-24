import 'package:flutter/material.dart';
import 'screens/Input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xffeceff1),
      ),
      home: InputPage(),
    );
  }
}
