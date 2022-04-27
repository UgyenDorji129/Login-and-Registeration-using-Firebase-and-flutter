import 'package:fcrop/services/auth.dart';
import 'package:fcrop/widgets/loading.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:form_field_validator/form_field_validator.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String password;
  final AuthService _auth = AuthService();
  late String error;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: loading
          ? Loading()
          : Scaffold(
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: 120,
                          child: Image.asset('assets/logo.jpg'),
                        ),
                        Text(
                          "Crop-Disease Detection",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            letterSpacing: 2.0,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .55,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(1627389952),
                                    spreadRadius: 2.0,
                                    blurRadius: 6.0)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: 65.0,
                                color: Colors.greenAccent[700],
                                child: Center(
                                  child: Text(
                                    "Signin",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Form(
                                  key: _formkey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            name = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "required";
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            hintText: "User Name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        validator: MultiValidator([
                                          EmailValidator(
                                              errorText: "Enter a valid Email"),
                                          RequiredValidator(
                                              errorText: "required")
                                        ]),
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            hintText: "Example@gmail.com",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            labelText: "Email",
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "required";
                                          } else {
                                            if (value.length < 8) {
                                              return "Password should be atleast 8 characters!";
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            hintText: "********",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            labelText: "Password",
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextButton(
                                            onPressed: () async {
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  loading = true;
                                                });
                                                dynamic result = await _auth
                                                    .registerWithEmailandPassword(
                                                  email: email,
                                                  password: password,
                                                  name: name,
                                                );
                                                if (result == null) {
                                                  print('d');
                                                  setState(() {
                                                    error =
                                                        'Error occured please try again with proper details.';
                                                    loading = false;
                                                  });
                                                }
                                              }
                                            },
                                            child: Text(
                                              "Signin",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Already have an account?",
                                          ),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              widget.toggleView();
                                            },
                                            child: Text(
                                              "Log In",
                                              style: TextStyle(
                                                  color:
                                                      Colors.greenAccent[700],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
