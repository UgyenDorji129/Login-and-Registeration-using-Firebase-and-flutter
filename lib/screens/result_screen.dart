import 'dart:io';
import 'package:fcrop/widgets/loading.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final File image;
  const ResultScreen({Key? key, required this.image}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool isImageLoading = false;

  @override
  Widget build(BuildContext context) {
    return isImageLoading
        ? Loading()
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/maize.jpg",
              ),
            )),
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.98,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15.0,
                        color: Color(4278190080),
                        spreadRadius: 8)
                  ],
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Image.file(widget.image),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.5),
                      height: MediaQuery.of(context).size.height * .35,
                      width: MediaQuery.of(context).size.width * .75,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Center(
                        child: Text(
                          "This is the Image",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
  }
}
