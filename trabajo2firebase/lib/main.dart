import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MainPage',
          theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.indigo
          ),
          accentColor: Colors.indigo,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
              primary: Colors.indigo
              )
            ),   
          ),
      home: HomePage()
        );
  }
}