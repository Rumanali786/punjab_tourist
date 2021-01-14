import 'package:flutter/material.dart';
import 'package:punjabtourist/components/Fadeanimation.dart';
import 'package:punjabtourist/components/roundedButtons.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State {

  TextEditingController emailTextEditingController = TextEditingController();

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
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            FadeAnimation(
              1.2,
              Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 30,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),

            FadeAnimation(
              1.3,
              buildTextField('Email'),
            ),
            FadeAnimation(
              1.5,
              RoundedButton(
                text: "Reset",
                color: Colors.green[300],
                press: () {
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

  Widget buildTextField(String hintText) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
      child: TextField(
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
}
