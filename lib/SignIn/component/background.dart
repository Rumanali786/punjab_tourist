import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}