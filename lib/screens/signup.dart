import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const MyBlue = Color(0xFF92b1bf);
const MyYellow = Color(0xFFf7f2db);

class SignUp extends StatefulWidget {
  //const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

late final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

late RegExp regExp = new RegExp(p);
bool ObscurText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? _form = _FormKey.currentState;

    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _FormKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please fill UserName";
                            } else if (value!.length < 6) {
                              return "Username is too short";
                            }
                            return "";
                          },
                          style: TextStyle(
                            color: MyBlue,
                          ),
                          decoration: InputDecoration(
                              hintText: "UserName",
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill email";
                            } else if (!regExp.hasMatch(value!)) {
                              return "Your Email is Wrong";
                            }
                            return "";
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        TextFormField(
                          obscureText: ObscurText,
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill password";
                            } else if (value!.length < 8) {
                              return "Your password is too short";
                            }
                            return "";
                          },
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    ObscurText = !ObscurText;
                                    
                                  });
                                },
                                child: Icon(
                                 ObscurText==true?Icons.visibility:Icons.visibility_off,
                                  color: MyBlue,
                                ),
                              ),
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == "") {
                              return "please Fill Phone Number";
                            } else if (value!.length < 11) {
                              return "Your Number must be 11 caracter";
                            }
                            return "";
                          },
                          style: TextStyle(
                            color: MyYellow,
                          ),
                          decoration: InputDecoration(
                              hintText: "Numéro de téléphone",
                              //icon: Icon(Icons.phone),
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                validation();
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: MyYellow),
                              )),
                        ),
                        Row(
                          children: [
                            Text("I Have Already an Account!"),
                            SizedBox(width: 10),
                            GestureDetector(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: MyBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
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
