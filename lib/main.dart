import 'package:flutter/material.dart';
import 'package:mcu_app/pages/home.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mcu_app/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCU Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:(!kIsWeb) ? Splash() : Home(),
    );
  }
}
