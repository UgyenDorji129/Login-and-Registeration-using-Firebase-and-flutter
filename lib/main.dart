import 'package:fcrop/screens/home_screen.dart';
import 'package:fcrop/screens/wrapper_screen.dart';
import 'package:fcrop/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomeApp());
}

// ignore: use_key_in_widget_constructors
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModal>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Crop Disease Detection',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routes: {'/home': (context) => Home()},
        home: Wrapper(),
      ),
    );
  }
}
