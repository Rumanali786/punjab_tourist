import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:punjabtourist/SignIn/component/socialicon.dart';
import 'package:punjabtourist/Signup/signup.dart';
import 'package:punjabtourist/components/Fadeanimation.dart';
import 'package:punjabtourist/components/contraint.dart';
import 'package:punjabtourist/components/create_account.dart';
import 'package:punjabtourist/components/roundedButtons.dart';
import 'package:punjabtourist/screens/forgetpassword.dart';

import '../main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  String p =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(
      () {
        _isHidden = !_isHidden;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return HomePage();
              }),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "skip",
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FadeAnimation(
              1,
              Image.asset(
                "assets/images/1.jpg",
                height: MediaQuery.of(context).size.height / 7,
              ),
            ),
            FadeAnimation(
              1.2,
              Text(
                "Punjab",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 20,
                  color: Colors.green,
                ),
              ),
            ),
            FadeAnimation(
              1.2,
              Text(
                'Tourist',
                style: TextStyle(
                  fontFamily: 'Assistant',
                  fontSize: MediaQuery.of(context).size.height / 35,
                  letterSpacing: 2.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            FadeAnimation(
                1.4,
                Card(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: TextField(
                    controller: emailTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.green,
                        )),
                  ),
                )),
            FadeAnimation(
              1.4,
              buildTextField('Password', passwordTextEditingController),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeAnimation(
                    1.5,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ForgetPassword();
                          }),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height / 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            FadeAnimation(
              1.5,
              RoundedButton(
                text: "Log In",
                color: Colors.green[300],
                press: () {
                  print(emailTextEditingController.text.trim());
                  {
                    if (!emailTextEditingController.text.trim().contains("@")) {
                      displayToastMessage(
                          "Email Address is not valid.", context);
                    } else if (passwordTextEditingController.text.isEmpty) {
                      displayToastMessage("Please provide password", context);
                    } else {
                      SignInMethod(context);
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            FadeAnimation(
              1.6,
              CreateAnAccount(),
            ),
            FadeAnimation(
              1.7,
              OrDivider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeAnimation(
                  1.7,
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {
                      print('facebook');
                    },
                  ),
                ),
                FadeAnimation(
                  1.7,
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {
                      print('google');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, dynamic controller) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          prefixIcon: hintText == "Phone number or email"
              ? Icon(
                  Icons.email,
                  color: Colors.green,
                )
              : Icon(
                  Icons.lock,
                  color: Colors.green,
                ),
          suffixIcon: hintText == "Password"
              ? IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.green,
                        ),
                )
              : null,
        ),
        obscureText: hintText == "Password" ? _isHidden : false,
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void SignInMethod(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false);
          displayToastMessage("You are logged in.", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              "No record found! Please create new account.", context);
        }
      });
    } else {
      displayToastMessage("Cannot Signed in!", context);
    }
  }
}
