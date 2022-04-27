// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcrop/screens/home_Tab.dart';
import 'package:fcrop/screens/tipsandNews.dart';
import 'package:fcrop/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final AuthService _auth = AuthService();

  List tabs = [HomeTab(), TipsAndTricks()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {
                  _auth.signOut();
                },
                child: const Icon(
                  Icons.logout,
                ),
              )
            ],
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.greenAccent[100],
            selectedItemColor: Colors.greenAccent[700],
            unselectedItemColor: Colors.greenAccent,
            selectedLabelStyle: TextStyle(
              color: Colors.greenAccent[100],
            ),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            currentIndex: currentIndex,
            elevation: 10.0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: currentIndex == 0 ? 35 : 30,
                ),
                label: "Home",
                backgroundColor: Colors.greenAccent[700],
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: currentIndex == 1 ? 35 : 30,
                ),
                label: "Tips",
                backgroundColor: Colors.greenAccent[700],
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          )),
    );
  }
}
