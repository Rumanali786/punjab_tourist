import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:punjabtourist/components/Fadeanimation.dart';
import 'package:punjabtourist/components/roundedButtons.dart';
import 'package:punjabtourist/main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                    controller: usernameTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.verified_user_outlined,
                          color: Colors.green,
                        )),
                  ),
                )),
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
                Card(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: TextField(
                    controller: numberTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.green,
                        )),
                  ),
                )),
            FadeAnimation(
                1.4,
                Card(
                  margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: TextField(
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.green,
                        )),
                  ),
                )),
            FadeAnimation(
              1.5,
              RoundedButton(
                text: "Sign Up",
                color: Colors.green[300],
                press: () {
                  if (usernameTextEditingController.text.length < 6) {
                    displayToastMessage(
                        "Name must have 5 Characters.", context);
                  } else if (!emailTextEditingController.text.trim().contains("@")) {
                    displayToastMessage("Email Address is not valid.", context);
                  } else if (!numberTextEditingController.text
                      .startsWith("+92")) {
                    displayToastMessage("Phone number in not valid.", context);
                  } else if (passwordTextEditingController.text.length < 6) {
                    displayToastMessage(
                        "Password must be atleast 7 characters", context);
                  } else {
                    registerNewUser(context);
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        "name": usernameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": numberTextEditingController.text.trim(),
        "password": passwordTextEditingController.text,
        "id": firebaseUser.uid.toString(),
      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Account has been created.", context);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomePage()), (Route<dynamic> route) => false);
    } else {
      displayToastMessage("Account has not been created.", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
