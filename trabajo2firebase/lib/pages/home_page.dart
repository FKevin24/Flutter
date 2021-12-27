import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/lista_producto.dart';
import 'login.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            return ListaProductos();
          } 
          else if(snapshot.hasError){
            return Center(child: Text('Algo salió mal'));
          }else {
            return SignInApp();
          }
        }
      )
    );
  }
}