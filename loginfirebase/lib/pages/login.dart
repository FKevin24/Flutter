
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginfirebase/pages/register.dart';
import 'package:loginfirebase/provider/google_sign_in.dart';
import 'package:loginfirebase/provider/sign_user.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'loggend.dart';



class SignInApp extends StatefulWidget {
  const SignInApp({ Key? key }) : super(key: key);

  @override
  _SignInAppState createState() => _SignInAppState();
}

class _SignInAppState extends State<SignInApp> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://upload.wikimedia.org/wikipedia/commons/9/97/Personas_y_tecnolog%C3%ADa%2C_dibujo.png',
              height: 100,
              width: 150,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hey Hola!!\nBienvenido',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Inicie sesión en su cuenta para continuar',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Spacer(),
          SizedBox(height: 10,),
          TextField(
            controller: _emailController,
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
          ),
          SizedBox(height: 15,),
          TextField(
            controller: _passwordController,
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
          ),
          Spacer(),
          SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              
              elevation: 5,
              onPrimary: Colors.white,
              primary: Colors.indigo,
              minimumSize: Size(100, 50),
            ),
            onPressed: (){
              AuthenticationHelper()
                .signIn(email: _emailController.text, password: _passwordController.text)
                .then((result) {
                if (result == null) {
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoggedInWidget()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                  result,
                  style: TextStyle(fontSize: 16),
                  ),
                  ));
                }
               });
            }, 
            child: Text('Ingresar'),
          ),
          SizedBox(height: 15.0,),
          
          Spacer(),
          GoogleAuthButton(
            text: 'Iniciar con Google',
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            darkMode: false, // if true second example
          ),
          
          SizedBox(height: 40),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Aún no tienes cuenta? '),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    }, 
                    child: Text('Regístrate'),
                  )
                ],
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  } 
  
}
