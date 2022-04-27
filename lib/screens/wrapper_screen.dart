import 'package:fcrop/screens/auth.dart';
import 'package:fcrop/services/auth.dart';
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  final bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return Auth();
        }
      },
    );
  }
}
