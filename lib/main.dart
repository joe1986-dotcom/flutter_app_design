import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_design/screens/quiz_screen.dart';
import 'package:flutter_app_design/screens/welcome_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),

    );
  }
}
