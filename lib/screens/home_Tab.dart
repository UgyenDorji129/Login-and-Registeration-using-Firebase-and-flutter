import 'dart:io';
import 'package:fcrop/screens/result_screen.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';

import '../widgets/loading.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PickedFile _image;
  bool selectFromGallery = true;
  bool isImageLoading = false;
  Future getImage() async {
    final PickedFile image;
    if (selectFromGallery) {
      image = await ImagePicker().getImage(source: ImageSource.gallery);
    } else {
      image = await ImagePicker().getImage(source: ImageSource.camera);
    }
    setState(() {
      _image = image;
      isImageLoading = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(image: File(_image.path))));
  }

  @override
  Widget build(BuildContext context) {
    return isImageLoading
        ? Loading()
        : Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/chilli.jpeg",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent[700],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 4, right: 12, top: 4, bottom: 7),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_enhance_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            setState(() {
                              selectFromGallery = false;
                              isImageLoading = true;
                            });
                            getImage();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Take Photo",
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent[700],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 4, right: 12, top: 4, bottom: 7),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_size_select_large_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            setState(() {
                              selectFromGallery = true;
                              isImageLoading = true;
                            });
                            getImage();
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Gallery",
                      style: TextStyle(
                          color: Colors.greenAccent[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2))
                ],
              ),
            ),
          );
  }
}
