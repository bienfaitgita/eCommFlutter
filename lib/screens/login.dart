import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/screens/widgets/changescreen.dart';
import 'package:e_commerce/screens/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

late RegExp regExp = new RegExp(p);

class _LoginState extends State<Login> {
  void validation() {
    final FormState? _form = _formKey.currentState;

    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  bool obscirText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: obscirText,
                      validator: (value) {
                        if (value == "") {
                          return "Please Fill password";
                        } else if (value!.length < 8) {
                          return "Your password is too short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscirText = !obscirText;
                            });
                          },
                          child: Icon(
                            obscirText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    MyButton(
                      onPressed: () {
                        validation();
                      },
                      name: "Login",
                    ),
                    ChangeScreen(
                      name: "SignUp",
                      whichAccount: "I Have not Account!",
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
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
    );
  }
}
