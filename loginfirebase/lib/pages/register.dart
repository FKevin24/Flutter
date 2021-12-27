import 'package:flutter/material.dart';
import 'package:loginfirebase/pages/loggend.dart';
import 'package:loginfirebase/provider/sign_user.dart';

class RegisterPage extends StatefulWidget {
  final String title = 'Registration';

  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passswordController =TextEditingController();
  late bool _success;
  late String _userEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
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
              SizedBox(height: 20,),
              TextFormField(
                controller: _passswordController,
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
              SizedBox(height: 40.0,),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo
                  ),
                  child: Text('Register'),
                  onPressed: () {
                   AuthenticationHelper()
                    .signUp(email: _emailController.text, password: _passswordController.text)
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
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
