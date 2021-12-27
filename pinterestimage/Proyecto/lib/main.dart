import 'package:flutter/material.dart';
import 'package:pinterestimage/src/pages/pinterest_image.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pinterest Imagenes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Imagenes'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[400],
        ),
        body: PinterestImage(),
      ),
    );
  }
}