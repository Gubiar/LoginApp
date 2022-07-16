import 'package:flutter/material.dart';
import 'package:login_app/screens/PageLogin.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(color: Color(0xff9F86C0)),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.97)
      ),
      home: PageLogin(),
    );
  }
}
