import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theking/pages/Home_Page.dart';
import 'package:theking/providers/google_sign.dart';
 Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'THE KING APP',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber
        ),
        dialogBackgroundColor: Colors.amber
      ),
      home: HomePage()
    ),
  );
}