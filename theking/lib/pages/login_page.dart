import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theking/providers/google_sign.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber[300]
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Image(
                  image: AssetImage('assets/images/logo.jpeg')
                ),SizedBox(height: 10,),
                GoogleAuthButton(
                  text: 'Iniciar Sesión con Google',
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                  darkMode: false,
                  style: AuthButtonStyle(
                    padding: EdgeInsets.all(10),
                    buttonType: AuthButtonType.secondary,
                    iconType: AuthIconType.secondary,
                    elevation: 20.0
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}