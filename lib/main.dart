import 'package:flutter/material.dart';

import 'intro.dart';
import 'strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff20477d),
        accentColor: Color(0xffe0ad0f),
      ),
      home: IntroPage(),
    );
  }
}
