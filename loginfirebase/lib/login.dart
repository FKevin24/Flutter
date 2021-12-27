import 'package:flutter/material.dart';
import 'package:todo_app/lista_producto.dart';


class LoginUser extends StatefulWidget {
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                 
              ),
              child: Text('Login',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontFamily: "Times New Roman"
              ),
              textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                hintText: 'Email',
                labelText: 'Email',
                suffixIcon: Icon(Icons.alternate_email),
                icon: Icon(Icons.email)
              ),
              onChanged: (valor)=>setState(() {
                  _email = valor; 
                }
              )
            ),
            SizedBox(height: 20,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: Icon(Icons.lock_open),
                icon: Icon(Icons.lock)
              ),
              onChanged: (valor)=>setState(() {
                _password=valor;
              })
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaProductos()));
              },
              child: Text('Ingresar'))
          ],
        ),
      ),
    );
  }
}