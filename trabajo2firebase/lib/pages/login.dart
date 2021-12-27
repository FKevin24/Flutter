
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/lista_producto.dart';
import 'package:todo_app/pages/register.dart';
import 'package:todo_app/provider/google_sign_in.dart';
import 'package:todo_app/provider/sign_user.dart';
import 'package:transparent_image/transparent_image.dart';



class SignInApp extends StatefulWidget {
  @override
  _SignInAppState createState() => _SignInAppState();
}

class _SignInAppState extends State<SignInApp> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),          
            Spacer(),
            if (!isKeyboard)titleDos(),
            SizedBox(height: 8),
            if (!isKeyboard)titleUno(),
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
                    MaterialPageRoute(builder: (context) => ListaProductos()));
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
            
            Spacer(),
            // GoogleAuthButton(
            //    text: 'Iniciar con Google',
            //    onPressed: () {
            //      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            //      provider.googleLogin();
            //    },
            //    darkMode: false, // if true second example
            // ),
            
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
      ),
    );
  } 
  
}

class titleDos extends StatelessWidget {
  const titleDos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Hey Hola!!\nBienvenido',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class titleUno extends StatelessWidget {
  const titleUno({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Inicie sesión en su cuenta para continuar',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
