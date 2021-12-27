import 'package:flutter/material.dart';
import 'package:loginfirebase/pages/home_page.dart';
import 'package:loginfirebase/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
 

Future main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  static final String title = "MainPage";

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context)=> GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.indigo,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.indigo
          )
        ),   
      ),
      home: HomePage()
    )
  );
  
}