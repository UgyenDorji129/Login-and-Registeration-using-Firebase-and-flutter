import 'package:fcrop/services/auth.dart';
import 'package:fcrop/widgets/loading.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:form_field_validator/form_field_validator.dart';

// ignore: must_be_immutable
class LogIn extends StatefulWidget {
  Function toggleView;
  LogIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  late String name;
  late String email;
  late String password;
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
                                    "Login",
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
                                    MediaQuery.of(context).size.height * .05,
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
                                            email = value;
                                          });
                                        },
                                        validator: MultiValidator([
                                          EmailValidator(
                                              errorText: "Enter a valid Email"),
                                          RequiredValidator(
                                              errorText: "required")
                                        ]),
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
                                        height: 30,
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
                                        height: 30,
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
                                                    .signInWithEmailandPassword(
                                                        email, password);
                                                if (result == null) {
                                                  print("u");
                                                  setState(() {
                                                    error =
                                                        'Error occured please try again with proper details.';
                                                    loading = false;
                                                  });
                                                }
                                              }
                                            },
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Don't have an account?",
                                          ),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              widget.toggleView();
                                            },
                                            child: Text(
                                              "Sign In",
                                              style: TextStyle(
                                                  color:
                                                      Colors.greenAccent[700],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Or",
                                        style: TextStyle(
                                            color: Colors.greenAccent[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('Sign In without Account?'),
                                          SizedBox(
                                            width: 2.0,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _auth.logInWithoutInfromation();
                                            },
                                            child: Text(
                                              "Log In",
                                              style: TextStyle(
                                                  color:
                                                      Colors.greenAccent[700],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
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
