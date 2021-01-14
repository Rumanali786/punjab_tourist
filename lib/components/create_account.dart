import 'package:flutter/material.dart';
import 'package:punjabtourist/Signup/signup.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'create an account',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 50,
              color: Colors.grey),
        ),
        GestureDetector(
          child: Text(
            ' Sign Up',
            style: TextStyle(
              decoration: TextDecoration.underline,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height / 50),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // ignore: missing_return
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
        )
      ],
    );
  }
}
