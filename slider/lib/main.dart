
import 'package:flutter/material.dart';
//import 'package:slider/src/pages/SliderShow.dart';
import 'package:slider/src/pages/pinterest_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      home: PinterestPage()
    );
  }
}