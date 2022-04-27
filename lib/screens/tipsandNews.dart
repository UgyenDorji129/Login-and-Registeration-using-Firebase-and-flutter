import 'package:fcrop/widgets/loading.dart';
import 'package:flutter/material.dart';

class TipsAndTricks extends StatefulWidget {
  const TipsAndTricks({Key? key}) : super(key: key);

  @override
  _TipsAndTricksState createState() => _TipsAndTricksState();
}

class _TipsAndTricksState extends State<TipsAndTricks> {
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
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://kidufoundation.org/wp-content/uploads/2017/07/kidu-slide1.jpg'),
                          fit: BoxFit.fill),
                    ),
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
                      child: Center(
                        child: Text(
                          " No tips and tricks!!!",
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
