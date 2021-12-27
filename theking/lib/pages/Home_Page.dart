import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Logge.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasData) {
            return LoggenInWidget();
          } else if(snapshot.hasError) {
            return Center(child: Text('Something Went Wrong'),);
          } else{
            return LoginPage();
          }
        }
      ),
    );
  }
}