import 'package:flutter/material.dart';

Widget btnIconRedondo(Function entrar, Function containerRedondo, Widget icon,
    String text, bool hasPadding, double sombra) {
  return Stack(
    fit: StackFit.passthrough,
    children: <Widget>[
      RaisedButton(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontFamily: 'Marvel'),
        ),
        onPressed: () {
          entrar();
        },
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      ),
      Positioned(
        child: containerRedondo(
          icon,
          hasPadding,
          sombra
        ),
        left: 0,
        height: 60,
        width: 60,
      )
    ],
  );
}
