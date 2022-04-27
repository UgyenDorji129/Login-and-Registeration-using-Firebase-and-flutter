import 'package:fcrop/screens/login_screen.dart';
import 'package:fcrop/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool isSignIn = true;
  void toggleView() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isSignIn
        ? LogIn(toggleView: toggleView)
        : SignIn(toggleView: toggleView);
  }
}
