import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth/Pages/home.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Todo: How to left align title field?
        title: Text('Signin'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                }
              },
              decoration: InputDecoration(
                  labelText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign in'),
            )
          ],
        ),
      )
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }

    try{
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user:user)));
    }catch (e) {
      print(_email);
      print(_password);
      print("failed");
    }


  }

}
