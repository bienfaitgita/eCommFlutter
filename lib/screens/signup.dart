import 'package:e_commerce/screens/widgets/changescreen.dart';
import 'package:e_commerce/screens/widgets/mybutton.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/screens/login.dart';
//import 'package:flutter/services.dart';

const MyBlue = Color(0xFF92b1bf);
const MyYellow = Color(0xFFf7f2db);

class SignUp extends StatefulWidget {
  
  // Function? onChanged;
  // SignUp({this.onChanged});
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obscurText = true;

class _SignUpState extends State<SignUp> {
  //late final String email;
  //late final String password;

  void validation() {
    final FormState? _form = _formKey.currentState;

    if (_form!.validate()) {
      // try {
      //   UserCredential result = await FirebaseAuth.instance
      //       .createUserWithEmailAndPassword(email: email, password: password);
      //   print(result.user!.uid);
      // } on PlatformException catch (e) {
      //   print(e.message.toString());
      // }
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
            key: _formKey,
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
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: "UserName",
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        TextFormField(
                          // onChanged: (value) {
                          //   setState(() {
                          //     email = value;
                          //     print(email);
                          //   });
                          // },
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
                          obscureText: obscurText,
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
                                    obscurText = !obscurText;
                                  });
                                },
                                child: Icon(
                                  obscurText == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: MyBlue,
                                ),
                              ),
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                          // onChanged: (value) {
                          //   setState(() {
                          //     password = value;
                          //     print(password);
                          //   });
                          // },
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
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              hintText: "Numéro de téléphone",
                              //icon: Icon(Icons.phone),
                              hintStyle: TextStyle(color: MyBlue),
                              border: OutlineInputBorder()),
                        ),
                        MyButton(
                          onPressed: () {
                            validation();
                          },
                          name: "SignUp",
                        ),
                        ChangeScreen(
                          name: "Login",
                          whichAccount: "I Have Already an Account!",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        ),
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
